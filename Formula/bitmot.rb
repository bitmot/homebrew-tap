# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.71"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.71/bitmot-macos-arm64.tar.gz"
      sha256 "bff66a19702f5a037a4f3cc07554994b9f409abecf1c76291bc9101228272410"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.71/bitmot-macos-x86_64.tar.gz"
      sha256 "725a205e8b18c7eeb7d818ba5a887778cf05b9df153ff31e555424d614b96a14"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.71/bitmot-linux-aarch64.tar.gz"
      sha256 "654fe69f08bb4a34d1374417ea58eccf2e6c93b4f0c198bcc119233cf766a125"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.71/bitmot-linux-x86_64.tar.gz"
      sha256 "5d4d7f98ebc8137be00a3ecbabbc816a04d832c501065e3dd3aaf42b575148c3"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
