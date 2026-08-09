# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.13/bitmot-macos-arm64.tar.gz"
      sha256 "c828210d618d1ad0a90d814dfbeca7c1027aed616a10e5a3620282c1b6452839"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.13/bitmot-macos-x86_64.tar.gz"
      sha256 "da627bbca945b6ca465f17b9248a2037375a5bf64cf7136147df9c2384d100ea"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.13/bitmot-linux-aarch64.tar.gz"
      sha256 "d5fd0f591eb013b2a7e2b158917b44d461592093e360ece4ad22d91c680ac579"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.13/bitmot-linux-x86_64.tar.gz"
      sha256 "3c4b711b1570423ba01ed07c93abff6701aff5fa78c47f376c91d688ac7a780b"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
