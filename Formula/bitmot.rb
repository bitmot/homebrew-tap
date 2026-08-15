# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.41"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.41/bitmot-macos-arm64.tar.gz"
      sha256 "c7a888cafbca4282eea592605e929cbf65d869c41b98c10fedc4a39b02dcd149"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.41/bitmot-macos-x86_64.tar.gz"
      sha256 "615bd40a79bfe5af23c336ff3a5311bf98d4cf6c1c79840b505cd84cc690a4f8"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.41/bitmot-linux-aarch64.tar.gz"
      sha256 "d4101b594816ea0c27f723357b2bce9f4474f6e1678ec0c3e248fc25ebfb5191"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.41/bitmot-linux-x86_64.tar.gz"
      sha256 "84cf8962e31424c926f6e6e07dab3481e0e5e1a13dbc007da4ca08196ca1ed91"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
