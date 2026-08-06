# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.7/bitmot-macos-arm64.tar.gz"
      sha256 "1cbadf5d83da0a4bd6b97dc2c18e3618de04aaf6689041a3fa0b40130c01ccdf"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.7/bitmot-macos-x86_64.tar.gz"
      sha256 "4cd66e8d4905fb0b79c288bf85c7c439d1a64cf2c293eef741b2ff5feeac94b6"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.7/bitmot-linux-aarch64.tar.gz"
      sha256 "6fa6aeb43b51d99fbf929a2f8680e023a984250c48c73c63bfb0f9aebf97b5d4"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.7/bitmot-linux-x86_64.tar.gz"
      sha256 "cdf8c0821a25e14a827b45d847f423ea306318ede784f3ae81cfb262036cd072"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
