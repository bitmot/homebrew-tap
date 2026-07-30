# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.71"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.71/bitmot-macos-arm64.tar.gz"
      sha256 "fe80524befdfca8e06295cb37e8dd500a04edec6c649550dccda9398f2f8b497"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.71/bitmot-macos-x86_64.tar.gz"
      sha256 "be75e1799f63663a5661e4752915f46bceb8086ed7a182fb8fc4f44be3e3dc4a"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.71/bitmot-linux-aarch64.tar.gz"
      sha256 "a3498f2e900cf16281623fedfc7d3bef73442347aa9e8088ca1a2154ed8e5cbb"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.71/bitmot-linux-x86_64.tar.gz"
      sha256 "c51305aae0c6964f84e1b7f3109044833ebe16c8e0c2fd370bdb1bd769d9e37f"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
