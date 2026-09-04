# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.68"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.68/bitmot-macos-arm64.tar.gz"
      sha256 "e34973061f955e5901f1f7543a2bdeb86078fa06b1b9f6e2be5591f0ba88ed5b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.68/bitmot-macos-x86_64.tar.gz"
      sha256 "07b958d13cf1ccf627ca69a8cab968b6ae2b0321d271f6a6db9f462e904d1101"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.68/bitmot-linux-aarch64.tar.gz"
      sha256 "c4629612cfcacc94771731d6046ff94ca69fe71de57dcb12c856ab61fa7fbd38"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.68/bitmot-linux-x86_64.tar.gz"
      sha256 "f0152084fcb9e786b2fdfe01efaa27cca8670dcf61fd89fb08e0aea211226a39"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
