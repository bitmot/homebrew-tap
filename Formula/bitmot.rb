# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.21/bitmot-macos-arm64.tar.gz"
      sha256 "b51afdb84560ea5a50a73f3aaa09bd5fd2a08af2ddeeadfc8d16fd71716d13df"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.21/bitmot-macos-x86_64.tar.gz"
      sha256 "fe1dab7254e2ec9683b317ae52b9a7fc244b1fa04440a93ca55a0ce3ced4a8bf"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.21/bitmot-linux-aarch64.tar.gz"
      sha256 "b11629615641a9891fe4961b0b6c91a608b003f82221d270b4215070e4096e9c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.21/bitmot-linux-x86_64.tar.gz"
      sha256 "a12e017f445b1d08c81685d534135fc64cbc5a3d60214952fb5956c1fef301ba"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
