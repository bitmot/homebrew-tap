# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.75"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.75/bitmot-macos-arm64.tar.gz"
      sha256 "e81783d67d525d8549c75797e288d1a88bc67ce0eb4fb7b3d421b5da1e543922"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.75/bitmot-macos-x86_64.tar.gz"
      sha256 "88aeee8e3648cec9d10e7f86ffaa085ca8f9ba4cbe17aee9d5e5166b4a4e60aa"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.75/bitmot-linux-aarch64.tar.gz"
      sha256 "9fa106cc435540f7d57baca6d1d8cfa30c73634177cef48e3af0b5bccfd0e506"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.75/bitmot-linux-x86_64.tar.gz"
      sha256 "d2929e8754b48b247a50cf7846e3960cea29ffee92f5acab18112354d829d258"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
