# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.19/bitmot-macos-arm64.tar.gz"
      sha256 "e12b1b18fe9692dcf94bb56edcc000d841b8b05ee1f75978b6d446a833353df2"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.19/bitmot-macos-x86_64.tar.gz"
      sha256 "2be6977955a1a24c08ed1dde8cf2cdcc9edb165f5c13d34436bbd644eaacf34d"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.19/bitmot-linux-aarch64.tar.gz"
      sha256 "277c74847cb241876dca2c0cdd78eba5dfd0e6526053d970e5a6930a376ce2bd"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.19/bitmot-linux-x86_64.tar.gz"
      sha256 "e56026af77e21edd9f00748b1d4646ce9f77f352c973f496369de49e562da802"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
