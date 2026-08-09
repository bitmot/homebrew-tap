# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.17/bitmot-macos-arm64.tar.gz"
      sha256 "c3fc1ab2472dd9d04575d5d579fc7c3caafbaa7caa6a7f92a01992152a2da891"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.17/bitmot-macos-x86_64.tar.gz"
      sha256 "b5af88257ca6608d7854868012ca1e5ade2150c7bd7c7f3af8c2d1ae9d0b2345"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.17/bitmot-linux-aarch64.tar.gz"
      sha256 "139e4a70d8f4add02add47ba19a4535062638ee65194acaf3744ddacc5a7a1aa"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.17/bitmot-linux-x86_64.tar.gz"
      sha256 "1e2208ad900ce8f88038906e3bbf04db970d285a67b62b23de195e7dca4c326b"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
