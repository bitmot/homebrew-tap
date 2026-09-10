# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.0/bitmot-macos-arm64.tar.gz"
      sha256 "a4b6c42c0ce23f55749606f83fed65d59205d399b0266f48a96ccab15d8ab1f3"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.0/bitmot-macos-x86_64.tar.gz"
      sha256 "8d6b6f0d6d048a0328c91335003e95c4c4519555ca35b0666db6c4f0ad6484ab"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.0/bitmot-linux-aarch64.tar.gz"
      sha256 "204d32ea46386f62ae55fa0e742324b9d2ad3208c3aa3b607efa7bf9d1784d76"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.0/bitmot-linux-x86_64.tar.gz"
      sha256 "c5000ddc8f53bb1df50628af71fcc97288aa41ccf0b59226f5d2a5994c1482ec"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
