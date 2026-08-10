# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.29"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.29/bitmot-macos-arm64.tar.gz"
      sha256 "627eae452c87ea59819d1530171bb20b6556643a53a527ebe5c10c8159eb0b7b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.29/bitmot-macos-x86_64.tar.gz"
      sha256 "2c46b215cb03ad252548be25a9d99a25b0b9de90f3836aa3aaaba27382a0e31c"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.29/bitmot-linux-aarch64.tar.gz"
      sha256 "59cf645faa08051b607342a74a3b280a970e39bde125c5607a7e1714aba15166"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.29/bitmot-linux-x86_64.tar.gz"
      sha256 "225d6da175432fa3da2fc4dfb5991f99cbb2faeec12fd8b099bafc2cee078dee"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
