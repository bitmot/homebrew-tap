# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.53"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.53/bitmot-macos-arm64.tar.gz"
      sha256 "431e1c079f2a7c3109934a95c45bb158a439c7b7767339b2ecf6db461bf522d2"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.53/bitmot-macos-x86_64.tar.gz"
      sha256 "57faa02e115031cb6dbc28dd7cc09927d29a3a25a58af9b3c678f08c2f17332e"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.53/bitmot-linux-aarch64.tar.gz"
      sha256 "8af863fcbb8eb21f3905562b21d0f72c11d66ba27bc17555c2d070cba612234b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.53/bitmot-linux-x86_64.tar.gz"
      sha256 "2dc43f13aac44def78f48f8183bb3fd7487d21fb42e402dd4e6dee64b9865ec7"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
