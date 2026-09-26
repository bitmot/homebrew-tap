# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.43"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.43/bitmot-macos-arm64.tar.gz"
      sha256 "544e1eaf9a8d2cd2dd02002831b0bb90ad1062ed0da67c7f7571624c91d1f78d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.43/bitmot-macos-x86_64.tar.gz"
      sha256 "9bf3fd0543413dfc1ea500a914515c8da70a6f9aa917b8549d3e21ae8bafc020"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.43/bitmot-linux-aarch64.tar.gz"
      sha256 "cfafe493949fcd19e49dcd61bf078bf5c4afa61483e6545c93447700d36dbbbf"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.43/bitmot-linux-x86_64.tar.gz"
      sha256 "66da0b1e85e266218fcea46c359de4d1b6f8d1ac57537bf70bd5ff91a227e8d3"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
