# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.74"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.74/bitmot-macos-arm64.tar.gz"
      sha256 "a10b962bea0852716a58d52922ad5dcc4b8c9c0c3f800019e725098cce390171"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.74/bitmot-macos-x86_64.tar.gz"
      sha256 "474b0e9ebd0502adc9dd45f13c21de4b3f3c664407bc81eba9dfe2374bf3d56e"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.74/bitmot-linux-aarch64.tar.gz"
      sha256 "d7b5cca78310961bc8d7e71c3e75e1f64f352b6095b2515fb2f5569d8376299c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.74/bitmot-linux-x86_64.tar.gz"
      sha256 "25bef63ba30f5f3111f1d185e6c175dc89b815fc97430e51cfad5e78cae21525"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
