# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.49"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.49/bitmot-macos-arm64.tar.gz"
      sha256 "430f88bef1bb1654d18d8fd747955dfd2800d5b24930b47cd912db2310f812f5"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.49/bitmot-macos-x86_64.tar.gz"
      sha256 "69aa49474a6bf6d93cc591d11a377d2d244888ccabf0d972e809721c0c319a97"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.49/bitmot-linux-aarch64.tar.gz"
      sha256 "ee951f016cca80a8a39b472057a9c648e4221848b0888ec132d59c03cef0b423"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.49/bitmot-linux-x86_64.tar.gz"
      sha256 "ed1e688d9dc54a33433ca74ae6a347d6c6339efb9da4126bfc3a8b121671733b"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
