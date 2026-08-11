# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.32"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.32/bitmot-macos-arm64.tar.gz"
      sha256 "d5c8903d8488c091c6e4aa7beb0030006caccc2cdc14a0fba2ac650fd71870a1"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.32/bitmot-macos-x86_64.tar.gz"
      sha256 "db05bd7b3db069408dfaf5590452621dda97cf4bbf254d0ba40953798f4ed573"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.32/bitmot-linux-aarch64.tar.gz"
      sha256 "b20446d0927ed53003aa5e631b77d9cd5358744dbe714f8001f8ec2c03d523ca"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.32/bitmot-linux-x86_64.tar.gz"
      sha256 "80245443dd186fceaa0f21c0fcac505eae1ae5b1ccdb70463d9af7fc8886d869"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
