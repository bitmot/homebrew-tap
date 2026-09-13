# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.11/bitmot-macos-arm64.tar.gz"
      sha256 "a4cd3c5f9a7be56b279169c41cb27a0dc432ca8079a11ce8c689c5421d1d06bb"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.11/bitmot-macos-x86_64.tar.gz"
      sha256 "2c8765e0b6ce2952ffac6e17a18bd60f11636524b7d025ae7c180d04d8aa366c"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.11/bitmot-linux-aarch64.tar.gz"
      sha256 "2cf719187c5323b91d895eb5e7e70528130c6c2b60f185bc5a4a55e5e60ffdd3"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.11/bitmot-linux-x86_64.tar.gz"
      sha256 "164918c6fc663d9dd0948ec6088771a1887cb27b42b4125341f40dcfd978adcc"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
