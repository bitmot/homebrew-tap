# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.45"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.45/bitmot-macos-arm64.tar.gz"
      sha256 "ffe8b8846878e2394a3432b41fcb5290e1094a4f46742e390c89fe97698d68c8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.45/bitmot-macos-x86_64.tar.gz"
      sha256 "6dd421b70069d9b48aa757fe48ab8c7e91676a82f7150452a4967239d806c9ea"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.45/bitmot-linux-aarch64.tar.gz"
      sha256 "08d73d79e6e2556e1c5aa52f51c1184a0341d124e47984c5601aa0be77a0dcf9"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.45/bitmot-linux-x86_64.tar.gz"
      sha256 "dc1cc7c63040f70c277d0c4511beeb7cd17bd9e0ade47543ce01461758cc94fb"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
