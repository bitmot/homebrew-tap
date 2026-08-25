# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.54"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.54/bitmot-macos-arm64.tar.gz"
      sha256 "26ec6457506a060e18c3e5bda3be93b4ad5d727293bf7469d5e4ba8795513546"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.54/bitmot-macos-x86_64.tar.gz"
      sha256 "0a940227291169a1d1dbf2d362eb3cf9ef021146316cf697ddd2e47bb11da812"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.54/bitmot-linux-aarch64.tar.gz"
      sha256 "5606a209fbe02b14bb34781a33bcaae76029a002d410940f78c1671af29fc063"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.54/bitmot-linux-x86_64.tar.gz"
      sha256 "75130e4954da8a726bc508f33bed7d957a9a1f9a01caf912f5000fb17cfb4fd4"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
