# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.30"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.30/bitmot-macos-arm64.tar.gz"
      sha256 "1db14c33d761ccf9de4f80eedc3c3184a4c6e79329ff12e260795586f3b06438"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.30/bitmot-macos-x86_64.tar.gz"
      sha256 "377ca04d97c2f484d9f713e2cf068f615f4f4103fdb6eca572ea0512cd602509"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.30/bitmot-linux-aarch64.tar.gz"
      sha256 "d50c1366e382830f4ea7e40284af76f959dc89ad5b5b179d7b966201b804b801"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.30/bitmot-linux-x86_64.tar.gz"
      sha256 "24d668c9a7ce70b5930b1f8d7a830c9a4036379bac5e5016372d8cf66e43929f"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
