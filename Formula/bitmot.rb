# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.52"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.52/bitmot-macos-arm64.tar.gz"
      sha256 "9a9f47ce45fc4f7ab737b75c4cfde6403c8e47e491efc2adb1bb82000c4e6010"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.52/bitmot-macos-x86_64.tar.gz"
      sha256 "58c6d1560b0b0d2065722b7d7a8a6e3cd96832fb04a04afd1498ed4b619fb3f4"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.52/bitmot-linux-aarch64.tar.gz"
      sha256 "5a95199534ffea51427d4b4e8eae540a94ae6438e822bbfa7c4b32db0bf93caf"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.52/bitmot-linux-x86_64.tar.gz"
      sha256 "fa4fd562fc03be683c30c77bffb1a6de99fc7a90976cae89616efe1716daa4da"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
