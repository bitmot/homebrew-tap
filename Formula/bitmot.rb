# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.78"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.78/bitmot-macos-arm64.tar.gz"
      sha256 "d214f2d76c0a56d437d0ac26fee14f66649dbd51a0ff38713ee14361cbe46758"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.78/bitmot-macos-x86_64.tar.gz"
      sha256 "6b37258d12532ebb0dfdb6b1186d6d86da11a4f8007440a42eb33416e9c70a93"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.78/bitmot-linux-aarch64.tar.gz"
      sha256 "98ce0fa9060eb759671e765f6b98849b9497342f84337bc1a1403b726edfc672"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.78/bitmot-linux-x86_64.tar.gz"
      sha256 "7f5db28021e3fb807a5d43892879646bce2644033e63557b1daf6d05a6e836e3"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
