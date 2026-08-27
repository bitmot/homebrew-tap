# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.59"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.59/bitmot-macos-arm64.tar.gz"
      sha256 "3ab89acd3ae3b9bf47193ccd1f6cbef81a0517a368fe406270951120ba6a9977"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.59/bitmot-macos-x86_64.tar.gz"
      sha256 "263b734fcc3896a0e74c90f1a61cd8895fb8d0679077e6638590a1f51e97d980"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.59/bitmot-linux-aarch64.tar.gz"
      sha256 "58e5be6584c3372e96a283b86c6daeee4cb31baffc82e1a5d4a6db059d93451f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.59/bitmot-linux-x86_64.tar.gz"
      sha256 "dc4d9b065c87861a7ac474d87a19b828606937e7080e6a0ef9b6732a6a74f2ca"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
