# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.33"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.33/bitmot-macos-arm64.tar.gz"
      sha256 "c0283d9dfc3acfd1b606a9b2f13d4b0225972c77e649227ab5e4ce8a22a32ff5"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.33/bitmot-macos-x86_64.tar.gz"
      sha256 "53bc7cb5d60e54f839827330bb9a3ea9c4dcfd00cb6eac64f954951a53a81ca9"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.33/bitmot-linux-aarch64.tar.gz"
      sha256 "42c6fbde65ee01750ee7856909a16e15aed5757ced8f21e74a2c208905e1abc2"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.33/bitmot-linux-x86_64.tar.gz"
      sha256 "8371bee5be53417a02dbe8e92906e4ffd159fc1a8b1802041482cff063fb1665"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
