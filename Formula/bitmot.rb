# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.47"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.47/bitmot-macos-arm64.tar.gz"
      sha256 "6d5915153c873c2bc2475c52d3aa27f73bea30d84b667e7e480797401112c130"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.47/bitmot-macos-x86_64.tar.gz"
      sha256 "32410b41c76fe9aa35128b2fe4dce27280e80cbefe3dd19ef4d11697a7572003"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.47/bitmot-linux-aarch64.tar.gz"
      sha256 "4ded7be17d8cfa7bf0ab8f72f0cf801eda0418593554c495d0f8e5d8b120da4e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.47/bitmot-linux-x86_64.tar.gz"
      sha256 "7860212e28192de89d0938cdf1329985b631d542f3d78babf178ed65b2a3be08"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
