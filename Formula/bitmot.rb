# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.54"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.54/bitmot-macos-arm64.tar.gz"
      sha256 "1c8da71f53653eafbaebeb967d920574466fdfbe625717af52979898662ddaa5"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.54/bitmot-macos-x86_64.tar.gz"
      sha256 "a53dc3279062ed70caa1a384fe7497546bccdbd4da1089be3ee9b5de738f9568"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.54/bitmot-linux-aarch64.tar.gz"
      sha256 "bfeff4846f01837ff2a23fb2ae8df1d2706ffe772c25a750c61ad89189657d81"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.54/bitmot-linux-x86_64.tar.gz"
      sha256 "4e933a96a85acf13a6f6ea691476da32646e7a39664019a4797643e44156d320"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
