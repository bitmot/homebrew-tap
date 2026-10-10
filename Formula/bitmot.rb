# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.55"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.55/bitmot-macos-arm64.tar.gz"
      sha256 "b75cb60b4d9243fbe5acb4db6ed6acf6566d6e06e542263b99a547bed2d1268c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.55/bitmot-macos-x86_64.tar.gz"
      sha256 "929087270c29bb98039654f5fc3729a46e43d3caa9274cce9f550ab7f2c8f65c"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.55/bitmot-linux-aarch64.tar.gz"
      sha256 "4f8eaa1c42026bdb3b0e85dd346deabeb9e7eb945c7f4723b24e5ddfed6b676f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.55/bitmot-linux-x86_64.tar.gz"
      sha256 "a02a29e636da0d7e7e16a9f826f7d3ce5edd5310705dc5a538072bfddcb18fdf"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
