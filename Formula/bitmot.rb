# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.41"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.41/bitmot-macos-arm64.tar.gz"
      sha256 "10189f85b36c92050157fb96aa8224d8135d6198b2cb48bf18d82235b19e7539"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.41/bitmot-macos-x86_64.tar.gz"
      sha256 "0ec851927e1a7fc54c60543857550c9aaefa889a7d5c980f83cbbfa1caccb813"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.41/bitmot-linux-aarch64.tar.gz"
      sha256 "076fab529ae2fcdd321416b8d5c43a75185eee739aff0adb95d4207b020e12a5"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.41/bitmot-linux-x86_64.tar.gz"
      sha256 "c6b4611ba9ffe8fcd743c10dbbbf3d405dd33985d310a91862026c5023caba72"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
