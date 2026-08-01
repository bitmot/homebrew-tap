# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.0/bitmot-macos-arm64.tar.gz"
      sha256 "b5d8dd5c7d4b7f962e6a47ad169490379d7b6d82139bd585152493f68400597a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.0/bitmot-macos-x86_64.tar.gz"
      sha256 "e09643e4d275a026b2f20ad63c38f0f1dd127826a42b9330136f518a692d4610"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.0/bitmot-linux-aarch64.tar.gz"
      sha256 "8b23add08392f2216eb6aa2d1c30ffbce03b8be3dd7b369d07dbe1f90b26ccb0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.0/bitmot-linux-x86_64.tar.gz"
      sha256 "3f4b00338d206b55ff5e3da69ea337253a49920e418f81e8d39b824b5b0c1f14"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
