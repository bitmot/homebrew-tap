# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.6/bitmot-macos-arm64.tar.gz"
      sha256 "a2d3e78437ab7d0382c0c4abea5337395184a778cb249ecb746ba9cd1e5c4709"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.6/bitmot-macos-x86_64.tar.gz"
      sha256 "e41f369f05de3badb57371ea89137987837a2d2fbc8e500b14bdc30d28dcb4ea"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.6/bitmot-linux-aarch64.tar.gz"
      sha256 "89bf54601fb11dc42aac9e5afca9852fe4e8572853684bf68231395edcf19bd8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.6/bitmot-linux-x86_64.tar.gz"
      sha256 "82f72f99576392a28450b10b6c64d5b4d55a9624cf0d9a885c0f8f73354e5275"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
