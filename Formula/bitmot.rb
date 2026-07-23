# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.46"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.46/bitmot-macos-arm64.tar.gz"
      sha256 "adc1c472894a3d01b55c27849a072d95a37c47b0e2afc3a89a8cca46085feab0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.46/bitmot-macos-x86_64.tar.gz"
      sha256 "8d9033b38e85dd199416618f9803d5ebf4bd1e053e1da57e56c6d460728755a1"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.46/bitmot-linux-aarch64.tar.gz"
      sha256 "07dcfdb67056c3d03fec39e849476554f242de9df018cfb032151439a037b094"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.46/bitmot-linux-x86_64.tar.gz"
      sha256 "b26a3c47cb78497b4ed7086ab18139ca43dd63d5365583cb8a196573a8fda407"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
