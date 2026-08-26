# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.58"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.58/bitmot-macos-arm64.tar.gz"
      sha256 "8273f55e3f1d55a2cca54c10549f94fc32dcc639cf78b7fb21213063c7935f9f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.58/bitmot-macos-x86_64.tar.gz"
      sha256 "f9d9485d39336eefd641e6d1d1f5e8c6afd1cd87b6096e5f83eacd05163e4ee4"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.58/bitmot-linux-aarch64.tar.gz"
      sha256 "efe921882a52bd3fc239580098835e9cd658293bbe5610c00a4794616bcff4e1"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.58/bitmot-linux-x86_64.tar.gz"
      sha256 "cb98449c92609bdf10a1088cf7dd0b5a26113bf767e8a6d9ce4b50342b0544f0"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
