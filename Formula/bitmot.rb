# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.57"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.57/bitmot-macos-arm64.tar.gz"
      sha256 "b428e09b9a722756d3608b499fa2b03bfda7f767c41957847ffcdc5e9484925d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.57/bitmot-macos-x86_64.tar.gz"
      sha256 "3093b41934dae3a7ba16a1f0a9d641d2f22ceb3001baa3af011fce2a4fa09734"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.57/bitmot-linux-aarch64.tar.gz"
      sha256 "0a1dd3243765c9a7543c1c0c9bc91d1a0495a0f9c7f695ace3819b855d8c653b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.57/bitmot-linux-x86_64.tar.gz"
      sha256 "475c33c0aeb814d76748a70d90b31140c2d58f1255b46b49c36b942c6aa24759"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
