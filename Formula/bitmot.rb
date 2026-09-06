# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.75"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.75/bitmot-macos-arm64.tar.gz"
      sha256 "19cbabc9c38b7ac2b01402c42ce613aeb675001906375ecca99d2e52053024a1"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.75/bitmot-macos-x86_64.tar.gz"
      sha256 "437f49c66873e4bb17e8d86493ac8dbfb88582c6436550668f82196ed38af471"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.75/bitmot-linux-aarch64.tar.gz"
      sha256 "e3f4a8a121e297b919d1311addb9d8c3f2f9b8068b3a2a4633c2074e9a764714"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.75/bitmot-linux-x86_64.tar.gz"
      sha256 "e5c7f543616dce5b0a8d0a8a32cf541cc84401c7ae7c8fafb9486b84c9653ab8"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
