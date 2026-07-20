# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.34"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.34/bitmot-macos-arm64.tar.gz"
      sha256 "0bfc3c809b9cbd41889b63ca311116fd5165400e792938414be00deefa7099b8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.34/bitmot-macos-x86_64.tar.gz"
      sha256 "c0d27d4bb20b7fbb4b5f85eff5c2d8169038486877d7277b19c7d0a19240e7bc"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.34/bitmot-linux-aarch64.tar.gz"
      sha256 "aaea18bfe4e0b2bd7a514faf97bf4d3e83ed4e14ac1f2058999aa30ab1b9dec2"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.34/bitmot-linux-x86_64.tar.gz"
      sha256 "e53227f2db360b4993379cde9a94498f8b3e2a549faaeb52efabb29307a39793"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
