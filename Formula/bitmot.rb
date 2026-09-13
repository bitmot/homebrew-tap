# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.10/bitmot-macos-arm64.tar.gz"
      sha256 "3a167139238296ff2a2df3a6211e51425ddf3b43d80cf83a8d24a3a9c3400340"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.10/bitmot-macos-x86_64.tar.gz"
      sha256 "43352aa31d625492d640a0a2d9ee23c7324809c1314b229c97a64cbafc515cfa"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.10/bitmot-linux-aarch64.tar.gz"
      sha256 "180d257e4ae52263f030e76c7f59328da9a960b27d51ee723d0851bb4a2655d8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.10/bitmot-linux-x86_64.tar.gz"
      sha256 "15e4ba0ed19342acb5dfab278d7655367f17f4296678fec8a3b56dce2387bc84"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
