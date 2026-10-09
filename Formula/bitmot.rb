# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.52"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.52/bitmot-macos-arm64.tar.gz"
      sha256 "c8b26e007047dd1c400ae2064d4e72f691e188519bb6e5f94e510d7c1d0603a4"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.52/bitmot-macos-x86_64.tar.gz"
      sha256 "78cba74cc95de744ea647060e372270e6ab52ad4a814b4a07420fe71cf2d7b15"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.52/bitmot-linux-aarch64.tar.gz"
      sha256 "f83b4b0a0c5bd354fea77082fb5baaedd9a5de862f364f9ca9ddc8d024041994"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.52/bitmot-linux-x86_64.tar.gz"
      sha256 "86f1bdbe9c8b313b7c9095138d5e82656fa01e1dde7e12526277917b76921c4b"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
