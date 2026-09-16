# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.15/bitmot-macos-arm64.tar.gz"
      sha256 "e9c6d4742e1f955203b5399a50b8d7b93785ad4114708ed59c357d21daad1ce7"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.15/bitmot-macos-x86_64.tar.gz"
      sha256 "83d2ce544c358439759fa094c00110c7f8346d451e267ee71ac0ad4bcf61a67f"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.15/bitmot-linux-aarch64.tar.gz"
      sha256 "72fda57fc7e6a8de404bd029261649eb9b48f80f6e719ec7beef52f2186e859e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.15/bitmot-linux-x86_64.tar.gz"
      sha256 "1fdd5df51369517cdef9daa0425a72ae215a99900931d27b77d7c200b5a5c04e"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
