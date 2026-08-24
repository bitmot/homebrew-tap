# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.52"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.52/bitmot-macos-arm64.tar.gz"
      sha256 "e369aa88b27cb552df67735724d0ac5759268ce92ea68f27370fac4ed3704e2a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.52/bitmot-macos-x86_64.tar.gz"
      sha256 "49666e1ab254c45246171a30a8042df473bd732a2f8799bc39a8be6e4f2e32ba"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.52/bitmot-linux-aarch64.tar.gz"
      sha256 "a389bbc4be83bb7d6dc507cb7ef108e16c8d8c17b85b2a6dd4955587f14c5fde"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.52/bitmot-linux-x86_64.tar.gz"
      sha256 "131eda6b047fc9e9afd5e94749518966e021e1a6f92fc474b4d55a8f6a3343c5"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
