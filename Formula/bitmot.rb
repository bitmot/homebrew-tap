# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.62"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.62/bitmot-macos-arm64.tar.gz"
      sha256 "d579201471825dba29c98a6a3caa5c3de97d97ada879c40b17dc865ea9af19de"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.62/bitmot-macos-x86_64.tar.gz"
      sha256 "45b71690f6c8cfcac625a3be1fe2b8f5ddee71aded6a1448b80ba09ea4b6b7ef"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.62/bitmot-linux-aarch64.tar.gz"
      sha256 "88c10ba533b76441d8f9559f443a077b21c8969897e906b3b731f1bfb8e62685"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.62/bitmot-linux-x86_64.tar.gz"
      sha256 "b9e3c17c01a51b97b1a41c478092dfb0793772b003ca3a94eafd945c77b7d563"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
