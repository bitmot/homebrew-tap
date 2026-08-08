# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.8/bitmot-macos-arm64.tar.gz"
      sha256 "5be63774b5e70bc211c5f40ba9ec38c99e1c540b5cfe659c7a6eebea0eb86953"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.8/bitmot-macos-x86_64.tar.gz"
      sha256 "6853b090fc0aa0820fb1b8a7ce06c1c2199f5cbeddc73ad8afccf3bd35cad555"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.8/bitmot-linux-aarch64.tar.gz"
      sha256 "89c1d0da04675be9a42502bf21a7790a604375f82cc9f1886d963369fec4660c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.8/bitmot-linux-x86_64.tar.gz"
      sha256 "6f21e741ec00a36c576583635e0da967097c775b4f5c197fa1308cdb33a1dafc"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
