# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.35"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.35/bitmot-macos-arm64.tar.gz"
      sha256 "598f627fad47030872207d80bc1295f0ab511f227140e530ef86675818c3a4ee"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.35/bitmot-macos-x86_64.tar.gz"
      sha256 "e8f8c5918cb242f9cb43d755fa47b9e03b39bed88c588a4b1a0c9d8dfc4d7455"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.35/bitmot-linux-aarch64.tar.gz"
      sha256 "9b669b35e53cd8a8311c54760dd0fd850df0c5a6130170fb3ed99e735974f3aa"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.35/bitmot-linux-x86_64.tar.gz"
      sha256 "fd3b88ddc891c8858edc591214f12c6cb6bd3fda3b0d6ac01a5057f0e7f623b7"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
