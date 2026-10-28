# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.67"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.67/bitmot-macos-arm64.tar.gz"
      sha256 "277f8ac9179eb232a3ff10b5e6c529fdb36379fe58ea2f7367ec585bd6f985a3"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.67/bitmot-macos-x86_64.tar.gz"
      sha256 "82115fb5ba59e1c948f308f7a7209b69114542904c9734b35328de892b802149"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.67/bitmot-linux-aarch64.tar.gz"
      sha256 "d67d83f9cfc194e5d84f5e0fc263d09fb594a8c1f6c58a8e610c1cc5ccba52bb"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.67/bitmot-linux-x86_64.tar.gz"
      sha256 "7c1948eed18a10b10efd301c220fbedbb676e686c2655bc687c46c6b7791a873"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
