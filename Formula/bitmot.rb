# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.36"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.36/bitmot-macos-arm64.tar.gz"
      sha256 "ecfa89e0ec64deb8adef4b2e668017233b7925c6373e9562535d870f3bf0718d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.36/bitmot-macos-x86_64.tar.gz"
      sha256 "c13b83c8d0bdda494197fea98cde358fba12b0d2c9d303e318679fa3e60ee604"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.36/bitmot-linux-aarch64.tar.gz"
      sha256 "6b6671caa4f25298503e31c95307f0328db7c2fa1c6e061e000d7b2ed0a2a689"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.36/bitmot-linux-x86_64.tar.gz"
      sha256 "f6ac32a3c1591601599b365bdce6d7fb811266243e5e8bc3084325839e76c1da"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
