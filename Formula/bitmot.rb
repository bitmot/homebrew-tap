# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.40"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.40/bitmot-macos-arm64.tar.gz"
      sha256 "d80fbbabef53f169aa25dbab600e97eb2250710b25c90c4afa0366728f9d3cd8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.40/bitmot-macos-x86_64.tar.gz"
      sha256 "90da5127c726e8d62919dd907dc6a6efaef09a2992cee4f42933f319cd53057e"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.40/bitmot-linux-aarch64.tar.gz"
      sha256 "e1e96cc6b5e754480dda9b1ae4dac32a4057c1437a77158bc0561f979defce1f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.40/bitmot-linux-x86_64.tar.gz"
      sha256 "490dcf9c8e464a19ed102c1150e2e425b83e60c6dd3d0955d1f83ee6420ac992"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
