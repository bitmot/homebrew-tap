# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.61"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.61/bitmot-macos-arm64.tar.gz"
      sha256 "febb504775822919d44c6e54cda1216ffdf4a662f7062d54a88c8ca27cdbaa0d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.61/bitmot-macos-x86_64.tar.gz"
      sha256 "db8138329af277b191c9997064b7b4a275757470db0bd5b2ea2e1f79f900f565"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.61/bitmot-linux-aarch64.tar.gz"
      sha256 "a749f96d8eada7bb99ea35ce149bbc29eaaa7ccfaaff97dfd0b0bb1b871e383e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.61/bitmot-linux-x86_64.tar.gz"
      sha256 "3b494d0bd949ed4407308b9a39b445dfe4ec0748998ea6d403ae08a678099dee"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
