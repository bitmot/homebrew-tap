# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.18/bitmot-macos-arm64.tar.gz"
      sha256 "0d30a1c51664bb0cc15cac712e6952076007127fe44899e2ffda328fbf53c58e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.18/bitmot-macos-x86_64.tar.gz"
      sha256 "aaaf2d948751a4f21e29c316904d80da3c384d5d0f7d1ca2d293949ebfd54e03"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.18/bitmot-linux-aarch64.tar.gz"
      sha256 "90d86f87077505cd1be05696248602cb4f6feca44ce947123cc281eb3256983c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.18/bitmot-linux-x86_64.tar.gz"
      sha256 "f2556155b68e61934d7b9750a890bc2290e1bd4ffcf63d96dc2217ad170a9755"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
