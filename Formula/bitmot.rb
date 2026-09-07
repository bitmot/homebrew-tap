# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.81"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.81/bitmot-macos-arm64.tar.gz"
      sha256 "60f7c5d83e9b7365228bbb3fe8c9fa1051fa808d746486937f6a4066a89f6a56"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.81/bitmot-macos-x86_64.tar.gz"
      sha256 "4722e40a4aa5bfd1650f6e01770440fc0df4e82d537b63e2260bf15b2ae139d0"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.81/bitmot-linux-aarch64.tar.gz"
      sha256 "b730710962bd8f49cb784e3395e0cc63508c46048068f94f4c53b183d86a58a9"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.81/bitmot-linux-x86_64.tar.gz"
      sha256 "eb2eb0b4ffed021f6eefa9734782a2301d3e4ba7c558222b3bd63a6c5d96331a"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
