# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.24/bitmot-macos-arm64.tar.gz"
      sha256 "31f8099800038c2153ab5ccf0a758fae8a3f16d0b19e01d77a0301cbb33efcd0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.24/bitmot-macos-x86_64.tar.gz"
      sha256 "2597cf76e4b27e032d753c1b466d35ac7bf6f606d29ed43ab54098a02c1bc963"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.24/bitmot-linux-aarch64.tar.gz"
      sha256 "fc4e5e2070709e93cea1d8eb8aaaa97f7dd88f320a5bc73eeab71ba274b39564"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.24/bitmot-linux-x86_64.tar.gz"
      sha256 "8c244144b497300d75a97160ccb71695539fcbb8ce25cc4a89faa281c2039236"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
