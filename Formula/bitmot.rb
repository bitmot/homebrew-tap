# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.37"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.37/bitmot-macos-arm64.tar.gz"
      sha256 "7d79695227ef33e55ebf992a485af9d0143af9a51f22a2af2cc31ee189d28e57"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.37/bitmot-macos-x86_64.tar.gz"
      sha256 "b3aab2a78b13f2557ed7481800d14df63b3e9a91101864774ec363708bd01db3"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.37/bitmot-linux-aarch64.tar.gz"
      sha256 "6f7811cdb1d32a43c28ddd593518c815041f279bab0b7de90773c3d0ecf13519"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.37/bitmot-linux-x86_64.tar.gz"
      sha256 "f99c47b51b79d4dfe746127bb57fd4e2df3006ce79c8de08f3e51bedc44f8b3c"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
