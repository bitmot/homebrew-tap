# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.55"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.55/bitmot-macos-arm64.tar.gz"
      sha256 "d2df44759d4c803d676900d1b835039bc64ccb2c1541138cdb8f4b3760df74ab"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.55/bitmot-macos-x86_64.tar.gz"
      sha256 "e74114b3b93f58cc70e4a9723e06db8474455404e2e5d82cee80a441786ff633"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.55/bitmot-linux-aarch64.tar.gz"
      sha256 "bbe6eeabb24910b50ae164fdbd9e6b91e3bfcd0d0fecd752fd0a5bfa830bc74d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.55/bitmot-linux-x86_64.tar.gz"
      sha256 "15a5403f17313bd4d0ecebf3a0c50471bc1146a93cb342284b7e7137e7c29d9c"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
