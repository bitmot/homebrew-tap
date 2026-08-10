# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.26"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.26/bitmot-macos-arm64.tar.gz"
      sha256 "2ccbdba5c6b112ba9e5c8544dad5002855af6399c1a893cfdb2a8d72d6b91472"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.26/bitmot-macos-x86_64.tar.gz"
      sha256 "cbeeab062ee3f79fda311a462b07062f5fc69e5d94dcb70c250b046c4998eb51"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.26/bitmot-linux-aarch64.tar.gz"
      sha256 "1d1d5b2c8e8865ce25a720b3cb544f97a8a4ea29638d0a913b870ba30bba7333"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.26/bitmot-linux-x86_64.tar.gz"
      sha256 "35d3d85671499c230c9951294700528baa7733db14745bc16b04bc8b180f6b92"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
