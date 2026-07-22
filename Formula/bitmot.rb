# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.42"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.42/bitmot-macos-arm64.tar.gz"
      sha256 "13d27dec329cde7576a514baf41ff6284da7c3e17a96ca8da906bb16f928edf4"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.42/bitmot-macos-x86_64.tar.gz"
      sha256 "44b4ee9eef20eba5c612539ef6c79c23043695139b4d2910b55705f429379c90"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.42/bitmot-linux-aarch64.tar.gz"
      sha256 "30471083c18036a993c1ffeee16bb5399cf211434805b08a85ce9ca4487a329e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.42/bitmot-linux-x86_64.tar.gz"
      sha256 "b29c864e9f8d7dfb82c0eef14db50271799d446d3f73bed1d95e720412f70ef3"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
