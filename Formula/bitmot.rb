# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.8/bitmot-macos-arm64.tar.gz"
      sha256 "7a659529d007b41be26d92a5b0891acee6393cbba9a142f322ea7b2060aa4292"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.8/bitmot-macos-x86_64.tar.gz"
      sha256 "022ef561abaa4bd434d46acc76d8aaa2ee34a703cb5b316b7831c1d551f8cba8"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.8/bitmot-linux-aarch64.tar.gz"
      sha256 "db11e379aeb13f00512f27a4d445e83b8f036d40277b8a8a063bf8fe32a6da2c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.8/bitmot-linux-x86_64.tar.gz"
      sha256 "556851b53f6d507cd31249a40f3880fa089e0fbdef46a8eb7e92ec6f1d253ab5"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
