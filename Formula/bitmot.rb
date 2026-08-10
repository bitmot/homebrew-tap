# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.24/bitmot-macos-arm64.tar.gz"
      sha256 "8cd99eb221d9cb8d166adea7c1994279b0e99ed786deab0df00b5d7eecd5d755"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.24/bitmot-macos-x86_64.tar.gz"
      sha256 "aa5e6437b0c6a02be767422b26ae14ec71bede9d1e1ddfb0885e010a4f9a6881"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.24/bitmot-linux-aarch64.tar.gz"
      sha256 "4a7cc35970f289ca2f01f220668d62d9add0a10db44998d11c459860a603fc81"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.24/bitmot-linux-x86_64.tar.gz"
      sha256 "a9226eb78ee0e8ef761d1e43193ef6b49f905e703fb3967b5a5ea33306a4114a"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
