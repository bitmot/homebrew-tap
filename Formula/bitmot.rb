# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.47"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.47/bitmot-macos-arm64.tar.gz"
      sha256 "1aeed98c4511857c8f006ec1d0e7c5ff9d3562a19d7d45c09526aee4f5749634"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.47/bitmot-macos-x86_64.tar.gz"
      sha256 "a103c02479d52d6a39d31c447d018ac3593cf8ae57a156fb71646e0bcc1a7fca"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.47/bitmot-linux-aarch64.tar.gz"
      sha256 "d9f841957f23c8713b395b5e607535c4a69100ff03bbe889926a6ad0bd0b4304"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.47/bitmot-linux-x86_64.tar.gz"
      sha256 "905194a39bae8397c9cc3d111327968651b888ed2b29f7f41e08900376e5467f"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
