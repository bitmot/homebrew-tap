# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.63"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.63/bitmot-macos-arm64.tar.gz"
      sha256 "7c4f2fa4f0afe79ac428cdc6dad5f9f75e6eb7aec5b477c7107899750fcf4145"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.63/bitmot-macos-x86_64.tar.gz"
      sha256 "f19432ac55de85d0beae1ae508e44c53e2d58922d3bbadc2a1d4e193a6d667ba"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.63/bitmot-linux-aarch64.tar.gz"
      sha256 "1d01a19cccbd23aefe74b3b1d11ed02487ceece6d8004803f18a7d0216b307ce"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.63/bitmot-linux-x86_64.tar.gz"
      sha256 "a8e53d5f43f9509ed5816debbd8244f7b71ff5fc54183ec60795beb3e3f31b38"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
