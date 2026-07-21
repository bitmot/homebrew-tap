# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.36"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.36/bitmot-macos-arm64.tar.gz"
      sha256 "c2ac478f95489fa9ac90ab95cc0065e2ea3ed569009c06e5940e260911ff6b97"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.36/bitmot-macos-x86_64.tar.gz"
      sha256 "17ce075c7d8016f872a704cd0e217c964bd0a7520e674c14ce5e2724cd0a4321"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.36/bitmot-linux-aarch64.tar.gz"
      sha256 "43def00078938aa1a0d44229de858c677953b511ad37c0b998ed2dfef4c869cc"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.36/bitmot-linux-x86_64.tar.gz"
      sha256 "9c03a79053f12dd5749f09ffbf610db18c4349bcf8f61c0b7d76028a01de6bc4"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
