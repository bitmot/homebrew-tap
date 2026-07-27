# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.59"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.59/bitmot-macos-arm64.tar.gz"
      sha256 "df232fc8f9ae71ea5269686e0e3534140870f17882ce3214f419ef8d1083d340"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.59/bitmot-macos-x86_64.tar.gz"
      sha256 "0e9eb5ec4402bc0e11f7d93990534997fbe5de3833ec7145ce3a68a0e3b5a38b"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.59/bitmot-linux-aarch64.tar.gz"
      sha256 "c2da06b43f464c2bb9a3500a68ac3dca75f8dd61ffc1f477bbdefd7350c5320c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.59/bitmot-linux-x86_64.tar.gz"
      sha256 "9d8d91abf83f2c157bf050d617872eb6fd797d15acbddd8a6be825c9f50c6c71"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
