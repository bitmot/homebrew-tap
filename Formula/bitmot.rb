# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.56"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.56/bitmot-macos-arm64.tar.gz"
      sha256 "22f6364470771f1ef7b5bc5998d0b074b846d8e8239eef03daa037a759190938"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.56/bitmot-macos-x86_64.tar.gz"
      sha256 "51e155b3751be514de86d216a21253fbd3716f1b050e6469ef767934f75a6772"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.56/bitmot-linux-aarch64.tar.gz"
      sha256 "65fa65cf967f877f5cb2b7d5a06889df043f18f681f59fe49bb383d5b71f9025"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.56/bitmot-linux-x86_64.tar.gz"
      sha256 "5ac5419a375989bc1022b16dbbdb3cb0a1026a8bcfae6b7de5f45d437dffbab6"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
