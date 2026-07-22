# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.44"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.44/bitmot-macos-arm64.tar.gz"
      sha256 "c72423fbd139fc0645500f4d156fb315e07c22bef98c60c5e64cac7446ff7d97"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.44/bitmot-macos-x86_64.tar.gz"
      sha256 "686583470595a0d62dc222a921e89d82d59492b9cd92f766ff651f6c6aec3c0b"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.44/bitmot-linux-aarch64.tar.gz"
      sha256 "72ea87053b1fb07b34dea29ec1bdedc69268ee03cb0605f0cbc20e4a93287a24"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.44/bitmot-linux-x86_64.tar.gz"
      sha256 "729e8aa004b263e81f6a2f7d59653db5779152d76f4bfc1b545c16ba03039afc"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
