# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.77"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.77/bitmot-macos-arm64.tar.gz"
      sha256 "6845aa4811f12373cdb805ab1a923093177bb0354d5630bc0cfc3ddacdebc8f4"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.77/bitmot-macos-x86_64.tar.gz"
      sha256 "5a71e7b802d21c6f372f32a3594abaeb687d2a5d61cfdbccfdff8381df53f1b9"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.77/bitmot-linux-aarch64.tar.gz"
      sha256 "600955c3158867f67a341168b58cf48c4cbd9180dee91baa097d0f8ba416c229"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.77/bitmot-linux-x86_64.tar.gz"
      sha256 "e72fc30256e9dbadadbea1854a25e0c9139c4ef60e56cd72fde12da25e0bc668"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
