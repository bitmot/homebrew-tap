# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.25"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.25/bitmot-macos-arm64.tar.gz"
      sha256 "5ac3843fe38cf45da9660db2c874745bfc116e353bad71075fef7f3cd5a4815c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.25/bitmot-macos-x86_64.tar.gz"
      sha256 "400f8f84a3ab8810d4e07294db075568f3a4ce45343e4687bd254d3446bd5fd1"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.25/bitmot-linux-aarch64.tar.gz"
      sha256 "3a508bd650d611cacb7d7663ab80a57ac42b5949bcc5be5cc44657cfa4389bae"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.25/bitmot-linux-x86_64.tar.gz"
      sha256 "40735c5e26c3b3961441292e25caaab3211ef1165757d977d7ab974583d8a6bc"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
