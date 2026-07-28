# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.68"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.68/bitmot-macos-arm64.tar.gz"
      sha256 "5ca74572aa2767bb8a87b5a7c0f35d9571a68af8e6ef5d8a911e7492936adea1"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.68/bitmot-macos-x86_64.tar.gz"
      sha256 "be4c0abaa49f5be9ead7b12cc5a44ee7727ef2bec1b870c296d0fa46196203cb"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.68/bitmot-linux-aarch64.tar.gz"
      sha256 "119cd65609d61f558cbad1708657ca460b845b5efac1f7314f636dbc1d48b17f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.68/bitmot-linux-x86_64.tar.gz"
      sha256 "a9b1db66ad0d5cb274ea4d23734baf26cc0f97dc3530d1ebd31734f97054bcfd"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
