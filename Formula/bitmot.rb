# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.79"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.79/bitmot-macos-arm64.tar.gz"
      sha256 "052db3e71ac89031ad2ec1e214d1d31c4c960f0d0f63d16c862b5fcadb1d45f6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.79/bitmot-macos-x86_64.tar.gz"
      sha256 "0d68ab30354b06ea00e2d8a9ffe74f0b5d252da872a7e562d5936234e21847c9"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.79/bitmot-linux-aarch64.tar.gz"
      sha256 "c1c628fecc021f11d0009721cd4975890ac36f5c19f2e11c3f2bcd9b3293a2a0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.79/bitmot-linux-x86_64.tar.gz"
      sha256 "50a0f2ff0edb09fa3e3ac3b00a6bf44650dd33f2000587c26e24b6adff599680"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
