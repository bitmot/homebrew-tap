# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.1/bitmot-macos-arm64.tar.gz"
      sha256 "e8f237004a19b5756c3ec57a1f0ecb982e4e88ca555afc2ec146bc93680be30c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.1/bitmot-macos-x86_64.tar.gz"
      sha256 "8b082c46200d35a3b99ef603247caa94256a590d6e7df722a879a27bf431c72a"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.1/bitmot-linux-aarch64.tar.gz"
      sha256 "0a2b9784ab81706dc8efa0d87ff4e68a95e60a2b98749940dcf9c52eec366e67"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.1/bitmot-linux-x86_64.tar.gz"
      sha256 "d1b3ce049af5e33bf6b26e904e19b34029261c99f19beda1dd20ae783bf7861e"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
