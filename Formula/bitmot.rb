# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.46"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.46/bitmot-macos-arm64.tar.gz"
      sha256 "7d07ff67cab422da38a38fcf22a4a132eb173b5ff28e433f07be2b5eb84cddc9"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.46/bitmot-macos-x86_64.tar.gz"
      sha256 "a40447dfc57dbff00e57f0d32ced7dc8321a5f3ea041dea187684ada5bf5da93"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.46/bitmot-linux-aarch64.tar.gz"
      sha256 "c6f5ff7f7f68b3f816411d81d9a856e5ecc085d6f1474a7f71189ea026df871c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.46/bitmot-linux-x86_64.tar.gz"
      sha256 "6198cdd033b5ca4c74c30dbc91499912daa3ca10318fc56f9642895eb47a2e62"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
