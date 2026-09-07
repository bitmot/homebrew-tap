# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.79"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.79/bitmot-macos-arm64.tar.gz"
      sha256 "f126c987e78960e3ceb23b0965eb406d9580eba4769d8844f1c82e27d28dd715"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.79/bitmot-macos-x86_64.tar.gz"
      sha256 "8394f51a11bd8164da7c5bbd1f671942b120b918590acd01b922fcee31738953"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.79/bitmot-linux-aarch64.tar.gz"
      sha256 "d74a08871d5fdf3813996c34a7c7319d6050284d6faa7bd0357751dc0e1f9ca2"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.79/bitmot-linux-x86_64.tar.gz"
      sha256 "54a4a00316cc607c3f9cb142e014ed4b95f57852e750a07b48e65a45a3423164"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
