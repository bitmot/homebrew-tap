# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.22"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.22/bitmot-macos-arm64.tar.gz"
      sha256 "2a1264a171dcb186ce44b24ceb0bb9af31869e8e1d0e369342a788a331f191ea"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.22/bitmot-macos-x86_64.tar.gz"
      sha256 "12d4a0934b289c62036f3cae5ef36f89ad09c45b319bfc26b2d7186748c529e9"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.22/bitmot-linux-aarch64.tar.gz"
      sha256 "7130ae60518b75275beab57ab276e54158b6c2a29779e5e62d79c6b7033d36ad"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.22/bitmot-linux-x86_64.tar.gz"
      sha256 "57c1bac7d7912c5c6b92c1e460c1331283c0fec8eaf38dc1385414fa3de56457"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
