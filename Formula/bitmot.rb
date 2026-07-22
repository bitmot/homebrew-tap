# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.44"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.44/bitmot-macos-arm64.tar.gz"
      sha256 "f340ed07a09636cb077ede2806fb7e2e3a075b1c85340d8d1f3cb45c3a2ebe9c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.44/bitmot-macos-x86_64.tar.gz"
      sha256 "75ede396c51ab954698e46469b921b8df2976f994b30117b18cb2636e260586b"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.44/bitmot-linux-aarch64.tar.gz"
      sha256 "8c389d9c32bff2647d1ea6cf153dca591823a5b8f11be2c59834aafc2781e87d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.44/bitmot-linux-x86_64.tar.gz"
      sha256 "20fd756a499ee6bdcb75d4ed6b4b1ffc8d442cd048a66b626a75e06c0257d7f9"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
