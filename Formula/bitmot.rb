# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.71"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.71/bitmot-macos-arm64.tar.gz"
      sha256 "b906989e0ff1426667b816ff0a002b45fb6ad507b616133c4fdbdba022a63608"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.71/bitmot-macos-x86_64.tar.gz"
      sha256 "3752e0a4f752d853cfc0a180c9644f7f45c303267fefbf7ca0d5b2b27965d805"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.71/bitmot-linux-aarch64.tar.gz"
      sha256 "4f2ced6e2346fcab0f1498df5e30c2d3deb3aefaf476d471c96eb5751d69de93"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.71/bitmot-linux-x86_64.tar.gz"
      sha256 "2f86bd7460f980ffb9de6124d8989ed4ea16bc187df7b293127d31dc34aa8447"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
