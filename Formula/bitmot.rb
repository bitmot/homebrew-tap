# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.78"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.78/bitmot-macos-arm64.tar.gz"
      sha256 "54bd4165c40fd9579e51a102a9d13710c2b07d11ed9d8554cba0f412c7aba022"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.78/bitmot-macos-x86_64.tar.gz"
      sha256 "0a3ef461610fd968ab30b2d1d245163d4a4e573552d84130015266d421e6ca0e"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.78/bitmot-linux-aarch64.tar.gz"
      sha256 "378ea5533dbf16994940f5b2e2e34dd5dd54c843a65f2871c0688c36db46fcd2"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.78/bitmot-linux-x86_64.tar.gz"
      sha256 "caff62df0630448b8c35ad61b8390a777d3d601323a38f318e5e7023d373db51"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
