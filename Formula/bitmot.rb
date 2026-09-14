# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.12/bitmot-macos-arm64.tar.gz"
      sha256 "d9c426c4161c67901865e07af3c7bfd6f4fffb8a14ff406f4c228944d9785b8d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.12/bitmot-macos-x86_64.tar.gz"
      sha256 "1752e4c4707f66efab777717b74ac26996cb422023a4da116733ebc4d12e8e05"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.12/bitmot-linux-aarch64.tar.gz"
      sha256 "1315cdcf0ee751286c8d4dbb836beda3555ce3482cfbe928d847932031baff31"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.12/bitmot-linux-x86_64.tar.gz"
      sha256 "fc2583bdf81a912497e96ef6820939a6204e0932e07c8f5d13c1c5ed039045f4"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
