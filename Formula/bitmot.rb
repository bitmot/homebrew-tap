# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.16/bitmot-macos-arm64.tar.gz"
      sha256 "eb087db84ba69894b853cf8218e76ad232c505e45088606839bd679eb673ec4f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.16/bitmot-macos-x86_64.tar.gz"
      sha256 "f1b4863917bf100855b03853b28d5adeff0da549b7af4255f23e8e7889a38356"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.16/bitmot-linux-aarch64.tar.gz"
      sha256 "2474bb1de1cd83d39a4a844585f416b10cbe5574aa3dc7fde5bc712e32e92916"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.16/bitmot-linux-x86_64.tar.gz"
      sha256 "54491e1a8cffbc9d5dc047908d9159174a5901c009f3566fdb1c6ad6bce6aaf6"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
