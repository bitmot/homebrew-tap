# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.32"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.32/bitmot-macos-arm64.tar.gz"
      sha256 "f555cfb716176b9e4e17bc8a00598e5133c5477b96796034bce20e3b8eec5e18"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.32/bitmot-macos-x86_64.tar.gz"
      sha256 "5d3fb31b05c4edcb0332bf67f2a16d9ca449d904c633cd676496705585c8a356"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.32/bitmot-linux-aarch64.tar.gz"
      sha256 "8fc217fa7abcee5a804116988f30515717aaa00f41dc4ede16b27d53627a20f2"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.32/bitmot-linux-x86_64.tar.gz"
      sha256 "8930cebd61c3a556fe6eb6f6ff80718dbd595199721d8d570dda85bbfa8a3856"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
