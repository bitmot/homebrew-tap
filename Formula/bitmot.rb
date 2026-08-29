# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.65"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.65/bitmot-macos-arm64.tar.gz"
      sha256 "53f186da4fd53fea4cc454594adb09223407572c49c9101354e46fe5b424542d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.65/bitmot-macos-x86_64.tar.gz"
      sha256 "7e74b685abaad96397257037939e0aee13d68a6abd079444afee0ee82c3a1138"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.65/bitmot-linux-aarch64.tar.gz"
      sha256 "be6783f83d93b12003ac6e53ed6b66b4196e8a385015cf689b26413d81e1afb6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.65/bitmot-linux-x86_64.tar.gz"
      sha256 "be2ddac2700b74c928d8dc71c49e560785315c7be75309d8c819e47ed27b2707"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
