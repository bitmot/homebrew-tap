# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.38"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.38/bitmot-macos-arm64.tar.gz"
      sha256 "6db6df441f98fb0d27b9e96cdf568791e8be66b5b0fb75ed04765566926f3596"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.38/bitmot-macos-x86_64.tar.gz"
      sha256 "1c5e11118de4d770575fb1b1d74338b39b7528373ed81c0aeabbb307fe8ca702"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.38/bitmot-linux-aarch64.tar.gz"
      sha256 "ba2d924d2d858f91de2bdbe8917d3395deb4878217c7330aefd5e42ccf442528"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.38/bitmot-linux-x86_64.tar.gz"
      sha256 "147f79b9855e9a47953ec8dad71894901b5190ca5fbaf1377493c723a86b7b62"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
