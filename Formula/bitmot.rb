# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.41"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.41/bitmot-macos-arm64.tar.gz"
      sha256 "a9ddcd2d2358d0db8058c4ed853dada42fb867c1c34e0d2a22caeeb3e2532987"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.41/bitmot-macos-x86_64.tar.gz"
      sha256 "f0af2a14e5792657db901ffeb95336812a76959a6399830d8f3b97b92e2a6050"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.41/bitmot-linux-aarch64.tar.gz"
      sha256 "45f1f966f76c4a92464f0787f24d7014ae29b97055f094745cd1542d11c50e1e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.41/bitmot-linux-x86_64.tar.gz"
      sha256 "9b35510d53db55868ef61ef34f229f4aa221e4b0f82f68a958e3b0d8520f501f"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
