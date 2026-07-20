# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.33"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.33/bitmot-macos-arm64.tar.gz"
      sha256 "b0bf532da71153a1f4036c25e647ea0ad74b6e2ae130c4d6fb21752aafe9a397"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.33/bitmot-macos-x86_64.tar.gz"
      sha256 "2ca60feaa3c1aaa09e3d5160c0697e3ca1bfcc9bdf64752cb4d778ae82d3406d"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.33/bitmot-linux-aarch64.tar.gz"
      sha256 "cf6885d867f4a85188867fd429734c16fbea139de20a3952a5a194c3461bfc55"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.33/bitmot-linux-x86_64.tar.gz"
      sha256 "1353133e939f930018b8fa528d682b1d7c774f6c6dd19e72125af8cb2b05a697"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
