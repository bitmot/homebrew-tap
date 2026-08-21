# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.47"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.47/bitmot-macos-arm64.tar.gz"
      sha256 "11cd40a513fd47e4460c38d502587db7e65c3dbfd8e808c81e3b2ee4232caacc"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.47/bitmot-macos-x86_64.tar.gz"
      sha256 "3157329a3507c4d550fb8212dd4a7503580baf5566e900b32fead45493c069a0"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.47/bitmot-linux-aarch64.tar.gz"
      sha256 "d10acacd6e0de7532fbacc4c3b0dba7fa89bb86da13c32070339ee6b957d8680"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.47/bitmot-linux-x86_64.tar.gz"
      sha256 "6382bcb1103305be09efebcd6387445eb4a0155ad6fb8d804b1608c956edb572"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
