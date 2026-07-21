# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.40"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.40/bitmot-macos-arm64.tar.gz"
      sha256 "80a653ada4e411a501823fa89769e2fa5c4b7f5cdc5482ae4b9c9028ef10740d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.40/bitmot-macos-x86_64.tar.gz"
      sha256 "17e3fe2a14850fdaa16dac6c3018263f6bd64d55cdd6d766ff8fc95316e2a65a"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.40/bitmot-linux-aarch64.tar.gz"
      sha256 "5c3f5cfb01a0f944fa19ef1eb36ce64c34210473d7976da6edb7206306c3fbb0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.40/bitmot-linux-x86_64.tar.gz"
      sha256 "033d34fa9a30abe77b2841ef612f844dac300ed617926c59c5b94d0318b603b2"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
