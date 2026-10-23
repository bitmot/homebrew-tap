# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.63"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.63/bitmot-macos-arm64.tar.gz"
      sha256 "8a3fac8f3e7d9a15a0c04e7d3f1ef87bde1e1613afbc876f802f1e0c2d1a5995"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.63/bitmot-macos-x86_64.tar.gz"
      sha256 "d62eb3e2b20c2be9b4262204b4b66db9beaa7c1401219ef24669db060a4aa197"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.63/bitmot-linux-aarch64.tar.gz"
      sha256 "f7eea57ea8172b7d9610517c43ae920a27f1ac406fd08eb89df9e3482e9c213a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.63/bitmot-linux-x86_64.tar.gz"
      sha256 "c5956106c8f530190e993ffb3f8a63ff26a80ed9a4676d495fc1b59e1f690cc9"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
