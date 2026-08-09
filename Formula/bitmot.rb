# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.15/bitmot-macos-arm64.tar.gz"
      sha256 "cde52c4fe3dc807d9b299da8550ae73c3cfd026feccedc8c2cc47bbe3b92ab6b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.15/bitmot-macos-x86_64.tar.gz"
      sha256 "98adedad659c6f6b9d185e78762a2fe273894081e0b339be644ba10cf277b175"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.15/bitmot-linux-aarch64.tar.gz"
      sha256 "fbbb674f55c5179bb08c7beebac5a8891f95dfef91d41b32c9bdd546eb247e39"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.15/bitmot-linux-x86_64.tar.gz"
      sha256 "ba78cfdb31dc63d7ff2c705255921c7bb20cebd974cc1ae960b7fd9989286d32"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
