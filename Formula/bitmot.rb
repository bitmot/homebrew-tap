# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.62"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.62/bitmot-macos-arm64.tar.gz"
      sha256 "719484364357701676c2a0f8e79604b22bca54d9b5dcb47a003477ddf38744fd"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.62/bitmot-macos-x86_64.tar.gz"
      sha256 "1308d86bb55f232ea604a40d679cfe429f64db8ca9d1306573a4dc22cfe2a929"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.62/bitmot-linux-aarch64.tar.gz"
      sha256 "37f2ea2e003c09ee65b283456485f0f15271460b3c7884c97ce5bd8d75fb96c0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.62/bitmot-linux-x86_64.tar.gz"
      sha256 "4be987966c499e486bf3ff7e62eeded625c8a3dbeeba3eb37b8c3761e6717041"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
