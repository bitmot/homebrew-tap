# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.19/bitmot-macos-arm64.tar.gz"
      sha256 "1756e42a6823b7c32f393069ee613d5ee521a3f8abdc2aada412bf9454d5e891"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.19/bitmot-macos-x86_64.tar.gz"
      sha256 "49e043dea2a7f15f5c3184f5aadc4fdc883486d6e120c0ad2f29349c0c31b409"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.19/bitmot-linux-aarch64.tar.gz"
      sha256 "633779a90e2e2eaa9852187a9fe168cd0913e68c9a5daeee033818c49d7c493d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.19/bitmot-linux-x86_64.tar.gz"
      sha256 "2cc031805da5864f608320711859036cdba56942aa7d743730660a72ebbbe67c"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
