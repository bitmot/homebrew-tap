# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.82"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.82/bitmot-macos-arm64.tar.gz"
      sha256 "008ab0b6b19e6e422661b18fb64ae77bfae7b8519eb32849f87f4081caf7c06b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.82/bitmot-macos-x86_64.tar.gz"
      sha256 "370cdbf5c44cbb5ab72f4ca706834239fe713c61d4e9ad2a9864224484a7326e"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.82/bitmot-linux-aarch64.tar.gz"
      sha256 "65bca713551afc81d95e7a0170287988fbdce7f8cfafa024c8c6dadb9ef7de01"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.82/bitmot-linux-x86_64.tar.gz"
      sha256 "e0aabd9f9d19d6a7405dd4794e2bf41a53cdef24fba7ae66f6e77bcf71147a0a"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
