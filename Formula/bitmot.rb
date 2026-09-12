# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.3/bitmot-macos-arm64.tar.gz"
      sha256 "73a7d116adc8d663ebd940d3ffe4426f8bd3eb44ccb4681987ed3f48ebbe4e07"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.3/bitmot-macos-x86_64.tar.gz"
      sha256 "5678d92b62e9f1158af11b35912aa9cdd142d91e4d6a33f1562810a59710e632"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.3/bitmot-linux-aarch64.tar.gz"
      sha256 "ff84f2c85ae3744146225da6ea688afeee053d1016fabe6348393cb934a19dfc"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.3/bitmot-linux-x86_64.tar.gz"
      sha256 "0ded5d05f01d8e917160960c5a7054745cb483b74d5e4697ddf7d7e90e777be9"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
