# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.49"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.49/bitmot-macos-arm64.tar.gz"
      sha256 "c8a260a1866fd13060f4895aa7a71bb5154631de2fde9eb7e57a0106d26dfe4e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.49/bitmot-macos-x86_64.tar.gz"
      sha256 "bd03c45c28accb61f4f3019ab904fa01663d347df8d3482eac0cf5efb0954711"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.49/bitmot-linux-aarch64.tar.gz"
      sha256 "04879a6094b133fc1787c16ab5863f3f7a283d54b03bda8a4be34512597a671c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.49/bitmot-linux-x86_64.tar.gz"
      sha256 "26f028f782d0ae8b7d85677a1380b904b35a3b3c66a2a68108ed503489f17dbb"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
