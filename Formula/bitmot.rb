# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.25"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.25/bitmot-macos-arm64.tar.gz"
      sha256 "dfe9ad56d6bdb4d4906e6eea2a1f85b7ec92083eda4533af9a6e5b900321c7d5"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.25/bitmot-macos-x86_64.tar.gz"
      sha256 "d6e8860ec228173bd7f96bb2bb88714e0a5e5501d9babe9075685c6b0f3c8c4c"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.25/bitmot-linux-aarch64.tar.gz"
      sha256 "90e9178e8a1583a5b1dea8569bf7d4f6197c6bd62a735eccfdfe2a75fb64dd48"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.25/bitmot-linux-x86_64.tar.gz"
      sha256 "a6f1e5f918b119e24f72d7547656ac9b768a923876e2534f66d700adccb4afd6"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
