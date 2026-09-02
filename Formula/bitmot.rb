# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.66"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.66/bitmot-macos-arm64.tar.gz"
      sha256 "2156e9382f39d639340df1155e76022779ea694b96c8accd0c62f43860485247"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.66/bitmot-macos-x86_64.tar.gz"
      sha256 "d7b254d6d08df0f2c3b7d7e1a2a5d7448a402b576c76c32f83e1d3fc2be0e020"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.66/bitmot-linux-aarch64.tar.gz"
      sha256 "a698dc0bf95e2c30179a2036d1c29a36b2594ddf9954165bf28a673d161dc5f9"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.66/bitmot-linux-x86_64.tar.gz"
      sha256 "bdd964247f443bfaf6e5a31aac8968411b5acb4f44a4b0649de83d24a419487b"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
