# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.13/bitmot-macos-arm64.tar.gz"
      sha256 "429db875e4e475a3c99664ee6c64786678df73b3ff6b48d3b86c47ba25772636"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.13/bitmot-macos-x86_64.tar.gz"
      sha256 "38c6bf1da77a98edd734b8bd2413aaf2a23f1fb33382ce3f6620aeea1206153f"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.13/bitmot-linux-aarch64.tar.gz"
      sha256 "8b228107d9582a329f442457623e9acb4f44f97ffc215f6e99b39c04e8d43344"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.13/bitmot-linux-x86_64.tar.gz"
      sha256 "aacf9a63b0446830698c95b9d4b65d151c1f49df9125bae8e6fd99a8083d1ec7"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
