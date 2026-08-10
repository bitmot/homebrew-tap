# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.21/bitmot-macos-arm64.tar.gz"
      sha256 "932a62713661448c9e0fa09a87049baede62edb73c12e868db01b6432ef85572"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.21/bitmot-macos-x86_64.tar.gz"
      sha256 "dd2c7daf80ba4dd8b2e655dff918f0bcc557df646238a9b17010f825f80560b5"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.21/bitmot-linux-aarch64.tar.gz"
      sha256 "2e0cd48d1a4b4066854aff2db29ba7e7fbc549c63a18ba7b79943b6fcfd96972"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.21/bitmot-linux-x86_64.tar.gz"
      sha256 "2a30d55bbf89250348c34a511509b4869f2655adc8a0dd784d56bed2cf3b205a"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
