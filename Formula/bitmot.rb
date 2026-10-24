# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.65"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.65/bitmot-macos-arm64.tar.gz"
      sha256 "d5f2ae9022b54078bc68b07871cbed3aae24c59c061d6d9aa6737ac40b231c42"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.65/bitmot-macos-x86_64.tar.gz"
      sha256 "be03c0429dffac79071a403c744aa66ea2fc881426bb9d1ce540485df1ff5a1a"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.65/bitmot-linux-aarch64.tar.gz"
      sha256 "aa461476711453cac51e7fea9d79c378500ccd654c48a10f1595414fa5f1cb0f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.65/bitmot-linux-x86_64.tar.gz"
      sha256 "0398b1f59d4d5c7159ad66304c4ce7b96ac29501fcddf517a1773f126f615961"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
