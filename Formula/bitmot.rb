# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.30"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.30/bitmot-macos-arm64.tar.gz"
      sha256 "d55ddadf78c95eb235356703f49dd69be0671071d8c80a30c49c17a39d2a4f5f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.30/bitmot-macos-x86_64.tar.gz"
      sha256 "44d5035fc332ee642dfe455d906b0a801edfd5da8887a32d004352bac68e3acb"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.30/bitmot-linux-aarch64.tar.gz"
      sha256 "155719ca5ef495c43db5b2f7b1c56dc867c331f5e4cf0fa4efc43cf6f9022b3d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.30/bitmot-linux-x86_64.tar.gz"
      sha256 "4029ec777371784dbd434cd388a67dfa4e18ebf10ef2dfad4239a88b3d4fc8a1"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
