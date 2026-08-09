# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.14/bitmot-macos-arm64.tar.gz"
      sha256 "c1545847d1dfee0518a1ea9c37979431f0b07db912a45a3d55eb7c1d14eb82a6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.14/bitmot-macos-x86_64.tar.gz"
      sha256 "8582e6f1d662fa803062ba16a0ba3cfe1539eab3c15b56a311d4b239092bf934"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.14/bitmot-linux-aarch64.tar.gz"
      sha256 "f07616dd465dc508e34820e2e7eb30ba2a6b8488dbf2912e084d73264375f579"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.14/bitmot-linux-x86_64.tar.gz"
      sha256 "d4da2fdf60437234c4d1420ce93dc24ae900f011dafbcaf10906d2e29ab8cac3"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
