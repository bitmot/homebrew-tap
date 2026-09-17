# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.17/bitmot-macos-arm64.tar.gz"
      sha256 "3997a7640cdada3a5eb50f9d9bee5c74c8210e41a68541347d80ee95b220d027"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.17/bitmot-macos-x86_64.tar.gz"
      sha256 "ec8b2743ada9e0c298b70346e71fecb281119481e676c82e4f99d2b7172290b8"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.17/bitmot-linux-aarch64.tar.gz"
      sha256 "cfb26d5c0700429ed35ad13371e720d047f934168e0f436f857477a3422fa869"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.17/bitmot-linux-x86_64.tar.gz"
      sha256 "e276e53dba26b524f478bc121f9962aeefccf0a8bbcfa26b2a60de6ef0488341"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
