# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.72"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.72/bitmot-macos-arm64.tar.gz"
      sha256 "4feff14c6f47704b241595000c5d642896e2769abfd5d16b8175eb67c8b16fac"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.72/bitmot-macos-x86_64.tar.gz"
      sha256 "e09fdc19a635407b372e95b96e2db7800406f441a230c2f5a7ba1f5bc7e5ada3"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.72/bitmot-linux-aarch64.tar.gz"
      sha256 "56c76eb4ab628ff17d2f967ba06f1fa8b7bc4cfa75b641bfc180227d0110d6b6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.72/bitmot-linux-x86_64.tar.gz"
      sha256 "b91324c61915eb02cf8240c42d0da54fb1b051a49d1028dbe5fdc5b79be28b74"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
