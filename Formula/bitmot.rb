# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.36"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.36/bitmot-macos-arm64.tar.gz"
      sha256 "44db166dbb799466d1eeaf672de3a88e1db9c748f9c85f91e2036117dcce403d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.36/bitmot-macos-x86_64.tar.gz"
      sha256 "9e5cb29a1735c61feb43d8044e5e2c4271667aa3821530de54d528f491f57fe4"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.36/bitmot-linux-aarch64.tar.gz"
      sha256 "cfe7575c34d223f9de4ddd4a0b58ae140ebf841f713350ba8e491dd40cf4e9d9"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.36/bitmot-linux-x86_64.tar.gz"
      sha256 "b8e63bf1104c527908ee8e8938b4d6329e9048471afafe3b3f9294e02948d9d4"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
