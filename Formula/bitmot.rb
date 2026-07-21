# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.37"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.37/bitmot-macos-arm64.tar.gz"
      sha256 "6bd269d0fe0111efc0e0880c7b64d443c12d0625e57cba66494282034a09916d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.37/bitmot-macos-x86_64.tar.gz"
      sha256 "98b3e27e0b07552bd8dbfbf71b813dbd2a535437ece93d52eaed9efd21765067"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.37/bitmot-linux-aarch64.tar.gz"
      sha256 "5b5a144ea9dccbffa07e8f40ce12b531dd09998b270b767b6631be37d0c6236a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.37/bitmot-linux-x86_64.tar.gz"
      sha256 "4584fe179d61ec22544888191cc1c9687957e4309d7e5a15a20ab94fbb344b31"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
