# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.50"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.50/bitmot-macos-arm64.tar.gz"
      sha256 "0a3a8ba81472edb150ce2e30ce1002ba15d215db5c96a869272c184106458bae"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.50/bitmot-macos-x86_64.tar.gz"
      sha256 "9953487df3a5ec372671d8828d47e3ab551eea55f4d879f1916578e40a4537b0"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.50/bitmot-linux-aarch64.tar.gz"
      sha256 "64c69e69bafe8bb0a97e7c9dfaee1ad69f34fa9c8bfedd505a6eaea0cb40a883"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.50/bitmot-linux-x86_64.tar.gz"
      sha256 "40c271d69324079ba5f18ccfb6f696ed30e84f19c535ba7af0550c64b41d96f6"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
