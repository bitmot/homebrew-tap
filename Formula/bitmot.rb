# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.66"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.66/bitmot-macos-arm64.tar.gz"
      sha256 "b45947cfe92d1339cad8ba4563f620bd7de7b41ddcccbdd2012fc730257f4a9a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.66/bitmot-macos-x86_64.tar.gz"
      sha256 "14edb93052c4e637f319702514e24cb349aa5d699c2758a4de1099ba1ccc9a3e"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.66/bitmot-linux-aarch64.tar.gz"
      sha256 "860254db050b9096dfb59eb4b2b0331b1613b8a58d875434dde0b41fb721d3b8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.66/bitmot-linux-x86_64.tar.gz"
      sha256 "e906807154470cc51d5ffeaee19f81806382d85bea604c492891042fb22c91da"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
