# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.39"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.39/bitmot-macos-arm64.tar.gz"
      sha256 "d3c3e5ba58be201171ba1dca3b7a8f95f32a79e43d6a27a4ab6e6e80a3948a19"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.39/bitmot-macos-x86_64.tar.gz"
      sha256 "e57bbf4e984fd7b75df9b1dcf526552be2f640e665035235d37abca9e5395e80"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.39/bitmot-linux-aarch64.tar.gz"
      sha256 "d0348bdc76e3a397cd13a8573422334be850291d300e6a71ce243dd25153a60a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.39/bitmot-linux-x86_64.tar.gz"
      sha256 "561f3458b86e6037cf9fd3121bdb833d1bd930c23494e7c3406e7bda66cc514d"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
