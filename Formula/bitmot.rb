# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.48"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.48/bitmot-macos-arm64.tar.gz"
      sha256 "7801c4ee7f7682fe82c9f5af5855f5d9ae1a98bcbe6b25fa537764f8955221ed"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.48/bitmot-macos-x86_64.tar.gz"
      sha256 "2076b11577c1b14c0e343ccb4fae54fd5bbcefeed54d5b2d99c9290787049898"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.48/bitmot-linux-aarch64.tar.gz"
      sha256 "e3e120ba4f9628e23e0495817ee8cc3b6725e2376cf332f5b4d418d08d50d134"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.48/bitmot-linux-x86_64.tar.gz"
      sha256 "47f7895ed5b2669408687b7daf079fce01a4706a2aecaeda2c67b4afec520f9b"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
