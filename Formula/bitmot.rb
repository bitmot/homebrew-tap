# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.2/bitmot-macos-arm64.tar.gz"
      sha256 "130b350b56ae5dc2c53e56f8c71fe100eb911a28dd61a3389b2c70020c9ae556"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.2/bitmot-macos-x86_64.tar.gz"
      sha256 "0bef77fec0a9179edffcf4d92684e781019ef0dc8fa03480ea1c0a391b3f3dcc"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.2/bitmot-linux-aarch64.tar.gz"
      sha256 "08e5b0f201df84c667caad3bdf40976f8e3cec712a81d306a3269a08f002f523"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.2/bitmot-linux-x86_64.tar.gz"
      sha256 "476dbf68bd83a00f19b00aee2b5fcda61e77b7d68817842efa59009fc2b931ab"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
