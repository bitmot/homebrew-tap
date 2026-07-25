# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.51"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.51/bitmot-macos-arm64.tar.gz"
      sha256 "7b513a0899278903ad635213053ab8598705304220576a556bbeaf70a795c7e0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.51/bitmot-macos-x86_64.tar.gz"
      sha256 "7440575dfc5095aa441faab775166d953420e6476faccd1b1a26b626d8c1f7f0"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.51/bitmot-linux-aarch64.tar.gz"
      sha256 "6225a9e7a915dacfbe05a8d7545d72d7add25dab949118de17be39edb2d570e5"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.51/bitmot-linux-x86_64.tar.gz"
      sha256 "390a226e46e14cb4e211a13bcb3ad17075b7847662036df88c024bf23abc8355"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
