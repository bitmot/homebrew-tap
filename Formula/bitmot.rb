# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.42"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.42/bitmot-macos-arm64.tar.gz"
      sha256 "c22a52250193a6659f84a23afd67ffedabedf66d05dc6baaf9851daf7205c9e8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.42/bitmot-macos-x86_64.tar.gz"
      sha256 "4debaffa50db68bd916cc98da87b2887264456569a9d8b65bac4f5035ee034fd"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.42/bitmot-linux-aarch64.tar.gz"
      sha256 "f52d7ca6f5ea89b6bc7996eb180d7266be3b570775e8cc6d2c2700f088ff6938"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.42/bitmot-linux-x86_64.tar.gz"
      sha256 "70cda1c30d6a266aac663659b7f70e45bbce80b4cc380f18073cd35d1a3daa73"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
