# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.49"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.49/bitmot-macos-arm64.tar.gz"
      sha256 "c35f9b66625908ffbc75e17f26cb7fb9e2818d62b031ca731221bee804045477"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.49/bitmot-macos-x86_64.tar.gz"
      sha256 "b892d3b6eed56703314859fd39bbac3e39e6b9234de04cc4d7575321a4417595"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.49/bitmot-linux-aarch64.tar.gz"
      sha256 "c4a662433a46d78afb2a3c6fadcb0ce9de8c829fa1d52a3b314f83b2c79a923c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.49/bitmot-linux-x86_64.tar.gz"
      sha256 "030d70dd664c6121bf5d1a67abe4a2810179a9cdd7167d455c515a70271527dc"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
