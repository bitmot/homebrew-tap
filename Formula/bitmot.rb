# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.57"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.57/bitmot-macos-arm64.tar.gz"
      sha256 "de9cf31becbdf29495b4e8ca7a7fe3eb9e60fa133d15355cb15f11306c1542b6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.57/bitmot-macos-x86_64.tar.gz"
      sha256 "3fddc71228f1068761e7766df636e44b7cd6f5b04dfb415463b86b244637f49a"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.57/bitmot-linux-aarch64.tar.gz"
      sha256 "7bc0b120e37d548ac0dc06bb992b2160254e03b5011693a32c66cdcd401af17a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.57/bitmot-linux-x86_64.tar.gz"
      sha256 "df96e6c0ad09ba2ae8e1a8994610cb63a77dca3ad65cf126e4ec71efd9cf8548"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
