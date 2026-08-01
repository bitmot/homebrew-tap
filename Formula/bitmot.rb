# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.2/bitmot-macos-arm64.tar.gz"
      sha256 "d261862e9aeab33993cf2ffe74610f3d63ac55533f0a6159af6946a12ad6a5d8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.2/bitmot-macos-x86_64.tar.gz"
      sha256 "81a76ab6058c5da9321a89e8d480586551cc6be63564ce295ad0c0dcc9c8f405"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.2/bitmot-linux-aarch64.tar.gz"
      sha256 "a153eabb181ed91fe54d2cfdb0163b9526c6e4f89aeafec5affa956a62f65d4a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.2/bitmot-linux-x86_64.tar.gz"
      sha256 "256acfefd0cb7804368d0a62c9d8f9da295ee14b39814c28141d323a4ba5de50"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
