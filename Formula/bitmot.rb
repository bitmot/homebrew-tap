# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.27"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.27/bitmot-macos-arm64.tar.gz"
      sha256 "ae2bf2af757f53bd3dff0342f9e3bfc09273a81f0f6a9b153067baf0c4b32e45"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.27/bitmot-macos-x86_64.tar.gz"
      sha256 "b630c60f1e23a9dc030309c6ecb617d782fe49551f378d7232278ba775a6c104"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.27/bitmot-linux-aarch64.tar.gz"
      sha256 "ac16f02b551dc524eb93e78a6df0dd9109d8e04e0b3015c9041fbc11a75c1a1f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.27/bitmot-linux-x86_64.tar.gz"
      sha256 "5463bf5f18cef81d39f48d10111092d4efa6df311856b93b7ce21b276f82e4e6"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
