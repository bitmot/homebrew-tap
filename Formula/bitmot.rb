# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.51"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.51/bitmot-macos-arm64.tar.gz"
      sha256 "7ae222110e44f1d82fffae772238b46bdba65858db5508f2250082e4065c6763"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.51/bitmot-macos-x86_64.tar.gz"
      sha256 "a97320b104879db0e30e73f738c32e811a19dac9fe1739b62f2cc22b373ca282"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.51/bitmot-linux-aarch64.tar.gz"
      sha256 "e7edc51d713d4483a96b42f8ed033d683af88ff33be964ba2bd9d5f1bc9cead0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.51/bitmot-linux-x86_64.tar.gz"
      sha256 "cb3a4d4ab827d0b81059920867b975c3091899b175ddc5a6e20972cedbe9666f"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
