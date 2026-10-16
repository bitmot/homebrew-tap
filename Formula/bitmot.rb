# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.59"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.59/bitmot-macos-arm64.tar.gz"
      sha256 "cbb53eead3449e7e00c90baf9ff6fd95a833a919637cea9b47aac93f829f67aa"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.59/bitmot-macos-x86_64.tar.gz"
      sha256 "f44bd82b741332dde4cae05f3575e6d223031e249d0eaa611f4b529ec7592509"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.59/bitmot-linux-aarch64.tar.gz"
      sha256 "f4c4d96e1222b0782ce00d60362515199715744881bac0ec60b69dc9b522a72f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.59/bitmot-linux-x86_64.tar.gz"
      sha256 "26968c614617e8262bd62eff086de7eccc209c3c64c40b9b1eecc2290463ef25"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
