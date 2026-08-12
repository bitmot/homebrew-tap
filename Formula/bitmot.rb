# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.35"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.35/bitmot-macos-arm64.tar.gz"
      sha256 "d49351c0c66b07b02b1487a2f851f40d8c8c55426ede31d1e835070822213f7b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.35/bitmot-macos-x86_64.tar.gz"
      sha256 "7f6147ee9800288f47dfacc518ec5d84787c4d2e8e4766ea111fed9648cd23ac"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.35/bitmot-linux-aarch64.tar.gz"
      sha256 "39c3b0850910e88d6b832ecddee7eb2fdce53b7cb6aec2907bad5ab679b14cea"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.35/bitmot-linux-x86_64.tar.gz"
      sha256 "92e435ddf9ff6ca2b87ddd826d65e768b775b243b230939e1eff2c04a8e2b7dc"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
