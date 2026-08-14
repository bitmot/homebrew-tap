# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.38"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.38/bitmot-macos-arm64.tar.gz"
      sha256 "7f00baec55b9afa17dcbaa44cffeac8f7710937247ffdd3e92aec45df6efb025"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.38/bitmot-macos-x86_64.tar.gz"
      sha256 "3dc89b5a4c97dbeb4a6d50e9f51de0d4751eed6faa076ab2678e9115601c6607"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.38/bitmot-linux-aarch64.tar.gz"
      sha256 "b5b830c6efc834401ee42bbdded1fdaad0edd254984e0fee7e100faa9876a96d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.38/bitmot-linux-x86_64.tar.gz"
      sha256 "e4553fc04f9a2e2947db67e75333cf42adf9febf0c796db3f42f6b3235041426"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
