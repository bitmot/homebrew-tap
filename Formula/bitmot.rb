# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.33"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.33/bitmot-macos-arm64.tar.gz"
      sha256 "cb696bf8ed5d52666f0732e7c03dad36d33aa556fd8c14979cea8b7510756fc4"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.33/bitmot-macos-x86_64.tar.gz"
      sha256 "2d51d7f9f7cae2f1f2ab8242668f537dd70e154933edb291c43448256833e85b"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.33/bitmot-linux-aarch64.tar.gz"
      sha256 "5ca1649272c5f3139482db15327686bf2552403bc1f547d507fd1f3d37b340be"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.33/bitmot-linux-x86_64.tar.gz"
      sha256 "bba6b4277fd7a54ede01ef2da5d1d0903823c9aea36f5b227582a0b1b0b314e2"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
