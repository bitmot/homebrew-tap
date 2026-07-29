# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.70"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.70/bitmot-macos-arm64.tar.gz"
      sha256 "24fd1a97cd1012d82b46178c5369498d289a4d1fae7dbb0fd3a691b88b7645d8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.70/bitmot-macos-x86_64.tar.gz"
      sha256 "09acbc414e42bfc13046e17ef0029f51e3ee989eaf62a1d408037a3f634dda67"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.70/bitmot-linux-aarch64.tar.gz"
      sha256 "cefc2108a998eada34c69c0e469c768910c9ce68704c282c3cab3ddec9e6a326"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.70/bitmot-linux-x86_64.tar.gz"
      sha256 "d9f8d877ff61a7e21d2d785109c2c89184674dac2e5adf90c3441d0b8d1dd76c"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
