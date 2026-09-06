# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.76"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.76/bitmot-macos-arm64.tar.gz"
      sha256 "683e685d8a4dd2c082424c22a2e67547224e907a04fb521b5dfa7a444a77709a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.76/bitmot-macos-x86_64.tar.gz"
      sha256 "1e11582f616165c4d83f18eb32caabd39d4ae48947c1621f324591f7a0ce9d7f"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.76/bitmot-linux-aarch64.tar.gz"
      sha256 "fe4cd3484ac4c55cb46b0a5f9a8ecbfd467464a5f2608428c7d75b94b45b2480"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.76/bitmot-linux-x86_64.tar.gz"
      sha256 "48e85366802a201891e2c90bc7bf42f4ba8f94cea94c4116a87b7db4b2673100"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
