# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.80"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.80/bitmot-macos-arm64.tar.gz"
      sha256 "3f86a827b21865e1bbf1159e024343a41e0534fadb865722b2ba92146f9b26ed"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.80/bitmot-macos-x86_64.tar.gz"
      sha256 "debd1297fbd05aac6b9fa6330f06038d79b1786e6988698fdcbe0e737c7a9d08"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.80/bitmot-linux-aarch64.tar.gz"
      sha256 "fcdcd1d3edb60af51abf545d75b34fd528773c4c42bc8ccd67c4f7e11dd15861"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.80/bitmot-linux-x86_64.tar.gz"
      sha256 "8356d1ba4675b8bb9d29768b8739ee0f62eeb7b5ab9136bfb5bbb8da7e20c5d2"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
