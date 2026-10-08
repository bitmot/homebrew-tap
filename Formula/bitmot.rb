# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.51"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.51/bitmot-macos-arm64.tar.gz"
      sha256 "5796a065c8763d70f0a9f71425c7cae0c0f3cf90a08593460ceeb6bf4bfb50ca"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.51/bitmot-macos-x86_64.tar.gz"
      sha256 "1fd33f5f447c5915c2d9424faeda76a785f90849d47177d3091373fe9d32c24b"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.51/bitmot-linux-aarch64.tar.gz"
      sha256 "494e941d507022e503266cd21214b02caa56f4e932e720a13471bf9a8435d9dd"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.51/bitmot-linux-x86_64.tar.gz"
      sha256 "9757e41b6678093247d971bd15e424a0dffa81c288444994e54fd22a0a4ca5c0"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
