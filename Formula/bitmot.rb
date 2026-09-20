# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.31"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.31/bitmot-macos-arm64.tar.gz"
      sha256 "333042e01dee37b07d763d1eeaf94a38fbf5a6ede9e10bb6274203f245acfc09"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.31/bitmot-macos-x86_64.tar.gz"
      sha256 "a02c8df77cea93f492e4b98cd542361f5e24aba5da6a4f975540f7748f574b61"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.31/bitmot-linux-aarch64.tar.gz"
      sha256 "030edfaba919c1123aef878592a5f69dff9fcfb46dcc684ec11b5db0a76e9089"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.31/bitmot-linux-x86_64.tar.gz"
      sha256 "df720df281eb96b3bd703c654657ff786f44387ff1d4914b249d5cf0aeeffca7"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
