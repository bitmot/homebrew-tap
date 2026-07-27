# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.58"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.58/bitmot-macos-arm64.tar.gz"
      sha256 "8d496110ad60d6658a3d2cb810a6b100928d9ccac17cf86cb50285be6eb973ab"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.58/bitmot-macos-x86_64.tar.gz"
      sha256 "a0c140bcdc376f64991ba09c030ad746221d43387485e9fa979a52e6465a2933"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.58/bitmot-linux-aarch64.tar.gz"
      sha256 "791972619d11c9c3b1870d9e3571d391273d757f48f81a6ce8843f78ae338526"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.58/bitmot-linux-x86_64.tar.gz"
      sha256 "3b9c161600198aeca0c3b59cc30586910764df4a07d77005142eb023fc4c2763"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
