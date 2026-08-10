# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.28"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.28/bitmot-macos-arm64.tar.gz"
      sha256 "3d9c220164e3452c9cdc05eb4d7ea9c4d6521a31fc21d0313eab12eb39c314db"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.28/bitmot-macos-x86_64.tar.gz"
      sha256 "621c7fb523179034d2286b28a4331331e7d2d5746545d177536f9db0fd4b2577"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.28/bitmot-linux-aarch64.tar.gz"
      sha256 "4a04bf77b335ce5f9356744d41e93cf8d7db0da350809ce1a5f43b1b1567be9a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.28/bitmot-linux-x86_64.tar.gz"
      sha256 "65f3a9b5a7618fef610504f0e9111bf2780c8f256296372bf79d24c5bca8be7c"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
