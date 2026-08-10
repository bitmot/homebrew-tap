# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.23/bitmot-macos-arm64.tar.gz"
      sha256 "c8034d9138cfbc0f8d3eb81ed635f4c738677201d8a222da5a8b6102b2ced4a9"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.23/bitmot-macos-x86_64.tar.gz"
      sha256 "4f4db992d730aa67d4ee5eea93a8e7422d572eb96388794bd9ee353e4e1aa198"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.23/bitmot-linux-aarch64.tar.gz"
      sha256 "e37733b3c4a7015e880d92b7872712b2aa23710b0dbbc1fc65dcbccf3b8a8998"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.23/bitmot-linux-x86_64.tar.gz"
      sha256 "27e2cfe80a44472cc4601dd8e710c1aa2e2788a32fc0ff9cf13343f4099b3f54"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
