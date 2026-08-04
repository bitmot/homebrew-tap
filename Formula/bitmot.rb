# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.5/bitmot-macos-arm64.tar.gz"
      sha256 "4bddabf0582bb707aeff91fa85a7f2eea2cec22e9e49fe665d4c78843c206171"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.5/bitmot-macos-x86_64.tar.gz"
      sha256 "12cb2346e6cb17125e3cd5f53778606f62322da17fb56c5b26691947a020a43a"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.5/bitmot-linux-aarch64.tar.gz"
      sha256 "79b5c19d6f482843e44e36a34f6f7284148869db3ee2be0a24f9ee11d6a73e00"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.5/bitmot-linux-x86_64.tar.gz"
      sha256 "a64c19d40223e7ba041e45245eae3efb6f05d860d524cf7a3385e48c3ad21d56"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
