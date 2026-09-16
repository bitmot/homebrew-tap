# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.14/bitmot-macos-arm64.tar.gz"
      sha256 "6765f911359c2f463e1d4403cc405fa2ae81502956186f7ce03a2d58c5c45214"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.14/bitmot-macos-x86_64.tar.gz"
      sha256 "7611f3d08c4bdb3f91ccdcfe753ecb4617098c4c9ab6e9815066154fddd24ac6"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.14/bitmot-linux-aarch64.tar.gz"
      sha256 "845a9e869090ab09e2ff61dbe10bb27afecb9b2a6e1fa1751445bf647b0dd461"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.14/bitmot-linux-x86_64.tar.gz"
      sha256 "9e704b38455e3af6e08d3683f33ff512801444346e6b54159babfd65a21cdcad"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
