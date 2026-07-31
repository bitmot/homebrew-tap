# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.73"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.73/bitmot-macos-arm64.tar.gz"
      sha256 "dd6a059685b76d5f24e95e997dcebd4413042b5cf24c582d117c39dd041b1de7"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.73/bitmot-macos-x86_64.tar.gz"
      sha256 "53bf5fd4ec341a1a220eb246bb086e67ab47ef7b9b87926aa9e5d0fff688a8c8"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.73/bitmot-linux-aarch64.tar.gz"
      sha256 "dc8ebf080b37786877c404e56cb8ac855aacb2a433d1f411bbd567dcee2aa74c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.73/bitmot-linux-x86_64.tar.gz"
      sha256 "aae62c81502dabf6e5cad2b726a7a56440f096ff168fb00f84fb059750f82e5d"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
