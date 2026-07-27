# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.61"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.61/bitmot-macos-arm64.tar.gz"
      sha256 "38edc2ef6939bbccbb4f90743cf6973ed46b9451404653e7b3a1f13d7073cb7f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.61/bitmot-macos-x86_64.tar.gz"
      sha256 "7f454abd5bceaa7ab86b01c7b9cfad89fbf43377100928fa5e51ac4d94986cf6"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.61/bitmot-linux-aarch64.tar.gz"
      sha256 "6d12b25bb21d006b1ead821a5e090367d5e35edcac871309631da78c7c1feccb"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.61/bitmot-linux-x86_64.tar.gz"
      sha256 "723d4e677a8cd455001659e0fb1c82490c6e35fa01ec244ee1dd796792afc328"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
