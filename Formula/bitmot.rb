# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.74"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.74/bitmot-macos-arm64.tar.gz"
      sha256 "02dba34ce6f2c92fa55fd7ddc286d1aabd9f50290748260cd91ef390184b9622"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.74/bitmot-macos-x86_64.tar.gz"
      sha256 "6c226a6c1e4ef11b7320c00f4adc31c55c0f85ef678d471298d56f81854f0063"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.74/bitmot-linux-aarch64.tar.gz"
      sha256 "6c62e43ca38b41647d93465c97a029b249b39b3999cc0131a131c4b4c08bb47e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.74/bitmot-linux-x86_64.tar.gz"
      sha256 "bb5a7480819a84021464385f0c013eddd81d15f5eb6b5dd21d4d6161dfbd23ce"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
