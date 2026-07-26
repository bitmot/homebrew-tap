# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.57"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.57/bitmot-macos-arm64.tar.gz"
      sha256 "1de18f6ef7660c167a8ec9e1cc7113a68090d5073b14bae35b86d992801c9d5d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.57/bitmot-macos-x86_64.tar.gz"
      sha256 "3c9372ed0b69f4d2ee4588e3db2a1cf57af92502214faa00ff890a53051058cd"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.57/bitmot-linux-aarch64.tar.gz"
      sha256 "2a3489fa4d431f9c62df0299d6d8c7fb21bda00c47418f309d9eca387abcd829"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.57/bitmot-linux-x86_64.tar.gz"
      sha256 "6ad774c315e1a6f6f58ffd1936fc972b12590420c82ed177e8579dd598e892c4"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
