# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.60"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.60/bitmot-macos-arm64.tar.gz"
      sha256 "654442f5021ff6fa41fa01ba49202244c59f158e64b3df36ed1abce5b4114980"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.60/bitmot-macos-x86_64.tar.gz"
      sha256 "416355a1f7dd83e1655159a1120b20698a0f26c9e5884868f87fea2cfb77d2fa"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.60/bitmot-linux-aarch64.tar.gz"
      sha256 "e0fe0ad0e337aed5b5d23aaf438c7a9b70a41fe15028996a2e784e980145e8f3"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.60/bitmot-linux-x86_64.tar.gz"
      sha256 "9b37f485e4ddbaeb231570704aff2c51dc5149005cdafed8bdcfb2fa8d290410"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
