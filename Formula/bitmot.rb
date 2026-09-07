# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.80"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.80/bitmot-macos-arm64.tar.gz"
      sha256 "2f18ad4386ffca81052319445c2497615c03769e8f296b218d6cf5139a9be457"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.80/bitmot-macos-x86_64.tar.gz"
      sha256 "2945216074457072c097cbd07556caae8045698c16eb9c7cca0712d0b5a8768b"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.80/bitmot-linux-aarch64.tar.gz"
      sha256 "b1acb1dd745dc44193b0ac85a9683301b4decae7de40bda60e9c818e34cf9c0b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.80/bitmot-linux-x86_64.tar.gz"
      sha256 "0f12f36f654f6dcd9278180df0edd7eaa5f71980d57bdcfa8cd46ecbb7d0439a"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
