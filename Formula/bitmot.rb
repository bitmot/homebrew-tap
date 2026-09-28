# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.44"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.44/bitmot-macos-arm64.tar.gz"
      sha256 "070206f3233d1759b8266a948c9eb1cc1de9184bc2d075fbeb3fb33e497568bd"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.44/bitmot-macos-x86_64.tar.gz"
      sha256 "cfc7cdaced982cad3b0034fd77e63bf94c0fd53054b0a6f3697d25a8a8e3d55e"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.44/bitmot-linux-aarch64.tar.gz"
      sha256 "9d2d06e22ef554d66d8cb48ed683c20172157a5c21afd14e56d9bcdefdabd7de"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.44/bitmot-linux-x86_64.tar.gz"
      sha256 "f4521169fb9b97f712500470bdad661d6b9ed012fac6fc55fa8365be3c297e5f"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
