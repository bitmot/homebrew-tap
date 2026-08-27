# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.60"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.60/bitmot-macos-arm64.tar.gz"
      sha256 "c5696ea41be1d6b2e9033d22066edc150cf9958933cd3b1fbee757f553b2f2e3"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.60/bitmot-macos-x86_64.tar.gz"
      sha256 "6235f73ba6823770953f9df93ece75dcae4a2644b32855722f26d0c41a54b7bf"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.60/bitmot-linux-aarch64.tar.gz"
      sha256 "caee51b06d4a7c1efcdcdfcb9918a8d2a334d0f355364a60e985ea5b90a50d2f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.60/bitmot-linux-x86_64.tar.gz"
      sha256 "7d86c9b1a96101069bd144a44f00dcb054d2da6ab8a24e1ad8f9d61015ed7d79"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
