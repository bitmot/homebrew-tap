# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.64"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.64/bitmot-macos-arm64.tar.gz"
      sha256 "bc9c8c2e3a606fdcb8b834c24f48ab56d2f444535a64a13be2f3d06c18cc88d6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.64/bitmot-macos-x86_64.tar.gz"
      sha256 "fabdd0c8bf0bbf2ee9ed46aefd283f345249ba3a838042051a65c5fa5672cb78"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.64/bitmot-linux-aarch64.tar.gz"
      sha256 "13cbbcf41cf0aaa044ef9db86ef564115d2bc2d09682820ba3b15f2847004cc2"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.64/bitmot-linux-x86_64.tar.gz"
      sha256 "2ce85423b9f0cd908dc2187c97e364c685bdca11893ec9f2bc0c7d6df4275d21"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
