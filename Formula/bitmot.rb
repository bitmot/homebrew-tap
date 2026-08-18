# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.44"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.44/bitmot-macos-arm64.tar.gz"
      sha256 "cc0a880a1f2456b3a6abb2388f13db35b76936a7b32c576ab87c888f1391408f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.44/bitmot-macos-x86_64.tar.gz"
      sha256 "6c825eb96f3c0927703cbf69a1f6bb966f10b28943ebbf5b4d3cf7585d74bce3"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.44/bitmot-linux-aarch64.tar.gz"
      sha256 "3b2b96e98ad5fcefc7252f923cf95e8c93cdb223a529c8d9b2bbe38d7d16b024"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.44/bitmot-linux-x86_64.tar.gz"
      sha256 "d7be38e93a8bc3d1cd5a54534f327e4d1f686d61ee3c241691e720e2146e96a7"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
