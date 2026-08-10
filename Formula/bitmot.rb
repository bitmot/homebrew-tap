# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.20/bitmot-macos-arm64.tar.gz"
      sha256 "9548a4258f28c4c84254879b0b4510519eade80bb3e199b6dbc4cc5d1e57920d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.20/bitmot-macos-x86_64.tar.gz"
      sha256 "7edf2d8991c13277b01de363e099e4fd64c6a6e46270193a7558715a3eb17585"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.20/bitmot-linux-aarch64.tar.gz"
      sha256 "0eda9451dfdb19cc84d389cbf71b13030415abbdb0c24d1a8189b5ce454ae856"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.20/bitmot-linux-x86_64.tar.gz"
      sha256 "57d1c6665e87e777fc293b3b5093678d59e8ef484e6ada0d4d8bf50a00882886"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
