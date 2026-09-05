# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.73"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.73/bitmot-macos-arm64.tar.gz"
      sha256 "301e2a1082f64931b504b0501ca9125bc8258321002c1e75ce7d5dbc2e33b2c7"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.73/bitmot-macos-x86_64.tar.gz"
      sha256 "77446b1b94c6ef008f3f7677c4d253068f8b1adb372c472c28ae2d65109b0027"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.73/bitmot-linux-aarch64.tar.gz"
      sha256 "74841f3e9df08d92f49c2abe26c9da0f1a7e3642a80a20dab9373ce5afb9ec50"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.73/bitmot-linux-x86_64.tar.gz"
      sha256 "2f869eb13ceb37fc880fe86e778e05b8083852ebb48d10b08f3cb4893d15529e"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
