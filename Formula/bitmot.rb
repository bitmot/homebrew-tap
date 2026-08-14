# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.39"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.39/bitmot-macos-arm64.tar.gz"
      sha256 "6c826405bd3022709c5e3056eae9ffa7d88363c495c594c9bfaed51ed97a32d6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.39/bitmot-macos-x86_64.tar.gz"
      sha256 "ff205c4c0b8c85a3558a1be2163a5587706fe3f2027741609610b8658b7aa043"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.39/bitmot-linux-aarch64.tar.gz"
      sha256 "bd0470aad5c4d4d049e622059769c1f4372958b60f989de5c516f9449ed41ce0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.39/bitmot-linux-x86_64.tar.gz"
      sha256 "b0ccc0102a223477c8969303f13eeb8330780f7bcae1fb3744570cc3a69f2516"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
