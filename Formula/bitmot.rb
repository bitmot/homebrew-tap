# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.70"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.70/bitmot-macos-arm64.tar.gz"
      sha256 "029101e8d8aee5ca042bcb0114a3cd7fe7411a031cfaf9f418b38dfb108ad279"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.70/bitmot-macos-x86_64.tar.gz"
      sha256 "b1e0ef296d25206c678b9572273f98dcba66b2ed174c535c8d803f4232b1cecd"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.70/bitmot-linux-aarch64.tar.gz"
      sha256 "8b18b1751ee2657dd7f72a4a56c2cde93eaaa51f5e67982748eae6cdb36f2dc7"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.70/bitmot-linux-x86_64.tar.gz"
      sha256 "aadeaa0acb80d4fe3ac16a879197d924f842725a6c3bf422d3c93b9581c55f96"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
