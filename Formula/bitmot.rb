# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.42"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.42/bitmot-macos-arm64.tar.gz"
      sha256 "7e413f306e87c1470f38b040c1507cb3e741e76524a00c424299d4a1afa060bf"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.42/bitmot-macos-x86_64.tar.gz"
      sha256 "285cae22915ac077bb97566c3f936ec6d3b12c9d375f4a5cbe5ec418101cb3ce"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.42/bitmot-linux-aarch64.tar.gz"
      sha256 "1fd2c31746a7d5bbd6078e4f64dbe3e61eb098425c21053ba715142097dbd99c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.42/bitmot-linux-x86_64.tar.gz"
      sha256 "7ac68ca722b52fa6a70b75c798c1c117250ae65c9fc3b204b42e99c7478b2656"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
