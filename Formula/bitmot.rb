# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.18/bitmot-macos-arm64.tar.gz"
      sha256 "404e86e0df90753afd556d36de3ad99758095e35977e6ffd8d680cf5e4fa2a22"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.18/bitmot-macos-x86_64.tar.gz"
      sha256 "d40bc0c5206c4fbf2ba363ac370822754b23a7a268d5df8bcb48c8c19b03e935"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.18/bitmot-linux-aarch64.tar.gz"
      sha256 "e03c965dbe51fdd6dd680562cb505993dbef3ab98889a5b4ec3194e07717342f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.18/bitmot-linux-x86_64.tar.gz"
      sha256 "36a4da19efff01a46ab6e5aed60d3e23313edcffb5425de513075769a204768c"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
