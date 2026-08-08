# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.11/bitmot-macos-arm64.tar.gz"
      sha256 "983ee04df3b163cb5f8656d2a396c5b9ab47b8ffab4e2ada29809dce3ce85df0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.11/bitmot-macos-x86_64.tar.gz"
      sha256 "f863f2e696c0c5338fffb725dda24752770ff0b8d11764456bcfe255cdfbc108"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.11/bitmot-linux-aarch64.tar.gz"
      sha256 "7961d587c0ca0a71470d623b43d2b48f109d8f536e20579e3e68e7f5dc1c0542"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.11/bitmot-linux-x86_64.tar.gz"
      sha256 "d51e663f0b2eeb1394dce78283dff0793a84439d4b3f81bd1f400b7fc1ff8076"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
