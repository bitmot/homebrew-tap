# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.4/bitmot-macos-arm64.tar.gz"
      sha256 "a21cd419e87c73fa236f998c05358db4ebf9c86ddfc67a09b013508e05610537"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.4/bitmot-macos-x86_64.tar.gz"
      sha256 "642f8c83093abe05df1f08efe2bc6f3ddf542c56078891192dd2b37ded5c8c7a"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.4/bitmot-linux-aarch64.tar.gz"
      sha256 "36d736d2a8e709b71e9b5f1067b04fba9623ba38f7e63544220c4b300bf65e5f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.4/bitmot-linux-x86_64.tar.gz"
      sha256 "3a824ac0166f6ac04167433ed6e922c74a94bc30e2feb8a81a28c651e8932563"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
