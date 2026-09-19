# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.28"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.28/bitmot-macos-arm64.tar.gz"
      sha256 "2777e12fc667b30007dba461e430d80f5b6949ecc91609c411dd0f04483a7f4e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.28/bitmot-macos-x86_64.tar.gz"
      sha256 "7c3582c84fceca1812f59cc18c6b807382785f78ef2b84aef01b291eb4947509"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.28/bitmot-linux-aarch64.tar.gz"
      sha256 "4d7360fa3ebb0113c69afe7f97d7999085fea3fd246fcfd632d987501cf703d2"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.28/bitmot-linux-x86_64.tar.gz"
      sha256 "d8b1f9bb54543674b0753ebd922b9b990f52056ef49c3f6820abf37684f46d90"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
