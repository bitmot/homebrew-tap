# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.61"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.61/bitmot-macos-arm64.tar.gz"
      sha256 "417e9d18820e4500adf472d86cc103198f41079eb6f5f1f86f02928505412e61"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.61/bitmot-macos-x86_64.tar.gz"
      sha256 "e8c8701224314ff0ac785d7c68487a4959829f4269f7690dedbd227b47d96b16"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.61/bitmot-linux-aarch64.tar.gz"
      sha256 "9a7bd11c64215f14122d3dd0b73ac2e1afd3d9f12abf6ad60226b7bdeff9e955"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.61/bitmot-linux-x86_64.tar.gz"
      sha256 "cd42179b995d2a7bd493ec0ae32a72b5e04607952f08e41da8bd29ae3f0b65b9"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
