# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.3/bitmot-macos-arm64.tar.gz"
      sha256 "cc3123a1148c02418db85025f528be0a0f8742cb548820f8028e59f98aa070f3"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.3/bitmot-macos-x86_64.tar.gz"
      sha256 "860f410d3102435f0c5b2d8d80f361f13c7ee9964c38074c14f4a60680264ed3"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.3/bitmot-linux-aarch64.tar.gz"
      sha256 "82b37566c5c067ef31003569e10474c218c0f3bae92f2b72e7e48dfe9043cb6b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.3/bitmot-linux-x86_64.tar.gz"
      sha256 "fc13b45909ffc3d96bf5278b86232025e6ce41669925b76068b3c84d1d5cf547"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
