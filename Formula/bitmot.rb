# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.45"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.45/bitmot-macos-arm64.tar.gz"
      sha256 "bdf096c5037066799ae5127d462f6d361b38a84fa8974d113b4d5a845b434ecf"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.45/bitmot-macos-x86_64.tar.gz"
      sha256 "b9ed2fca73157ea40fcd02eac8f7de51c7a8b376b3fd32246e5e711a247ca232"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.45/bitmot-linux-aarch64.tar.gz"
      sha256 "7d638bb962476ce1bf2cfbfa2009d2663ccc6073a2461fdaf23aa6beb3830a8d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.45/bitmot-linux-x86_64.tar.gz"
      sha256 "b9e473292b7bcdbf0fe35e21c0268c7c6a03a65324598603bf9f0d5d76d43664"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
