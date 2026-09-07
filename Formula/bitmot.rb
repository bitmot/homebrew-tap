# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.83"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.83/bitmot-macos-arm64.tar.gz"
      sha256 "4b468c929984526bbdf763539d016513a7eb146d563196249a4f90cd0fe3a8f8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.83/bitmot-macos-x86_64.tar.gz"
      sha256 "75380c4e0499255e9bab754df01da750d9a18e28120a5c0512cbc6c813b79fc8"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.83/bitmot-linux-aarch64.tar.gz"
      sha256 "1c137f7a71e004204b008719eba385e6453a3da34ee941fbc18675a3ad1bb983"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.83/bitmot-linux-x86_64.tar.gz"
      sha256 "1945dff34ac71b7fd3aec44ae409d2846c46598ea5ddf876454f1080d80e1be3"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
