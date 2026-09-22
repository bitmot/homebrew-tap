# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.37"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.37/bitmot-macos-arm64.tar.gz"
      sha256 "2024a83b8a390e6e271dbb5560307eae2d63c73df29d51771906a41a26175904"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.37/bitmot-macos-x86_64.tar.gz"
      sha256 "d652f1a885a4002b8b175f68798d248855f62d1d376ac6da2e0d34f84e034eb9"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.37/bitmot-linux-aarch64.tar.gz"
      sha256 "97cc0569a27a78924ca7a8e9c0cbbc49e4b19fd0be0225d8c5924e81e882dc6b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.37/bitmot-linux-x86_64.tar.gz"
      sha256 "992c2fd61f5c70cc160b4f1f9441ea2c87e7ad81d26f2bc62ce7cc55510eb96d"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
