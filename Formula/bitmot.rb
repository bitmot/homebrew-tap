# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.29"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.29/bitmot-macos-arm64.tar.gz"
      sha256 "a37e743f8cfcda3696d65db79df8709feb722a01277d0778be859f19040242bc"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.29/bitmot-macos-x86_64.tar.gz"
      sha256 "25f8348d64ff8baac09e5c26753da9882b2ecd67a80ab2b124f8882517620242"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.29/bitmot-linux-aarch64.tar.gz"
      sha256 "5c4a9f6bc43d9cae519014b488fa2427c05f7b791f6bc6ae96d74b11eeeeb6b6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.29/bitmot-linux-x86_64.tar.gz"
      sha256 "d89e1f0310fa2b38cd57b372e229563ebabbecc76110352e43c664071ecc2266"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
