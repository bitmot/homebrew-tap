# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.53"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.53/bitmot-macos-arm64.tar.gz"
      sha256 "07e7672c5f1bdbda41e75c890e8f4ea3b896edd322ecf168ade2f9392128f7d3"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.53/bitmot-macos-x86_64.tar.gz"
      sha256 "f737535e277f5ea30916bce2825ee671a78199edeb5f0557c36b04107643aba5"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.53/bitmot-linux-aarch64.tar.gz"
      sha256 "972d3927f34da5a6eb097020517ce9244c128373339c7a66e695ee77897e4c07"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.53/bitmot-linux-x86_64.tar.gz"
      sha256 "2083460508cc574800e5ebf116b052f5d363788a6f6b9b63c75890ca0f17c6e0"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
