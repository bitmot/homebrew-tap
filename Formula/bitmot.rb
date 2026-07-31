# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.76"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.76/bitmot-macos-arm64.tar.gz"
      sha256 "ff215b66b3ff428d53416f76e680bed00c13e68b793b75950adc1ab8e97f63ea"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.76/bitmot-macos-x86_64.tar.gz"
      sha256 "99fed092383e29e5a6a3bae15901c05c7ee26074829ec7fda04d14bb779d8336"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.76/bitmot-linux-aarch64.tar.gz"
      sha256 "197769976b26fb45c439613bea253c6b83a833fd1b46c559e94b61e18b9d52a6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.76/bitmot-linux-x86_64.tar.gz"
      sha256 "a4f558ee4ea548a9e0036ed8df7f572f4c0201058eb1c799a4a8f26a0a47f203"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
