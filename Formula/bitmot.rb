# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.38"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.38/bitmot-macos-arm64.tar.gz"
      sha256 "bfdfd16f26e39e065d1687bafb75507c0a06a2baa2268ebb073971d1b1d30467"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.38/bitmot-macos-x86_64.tar.gz"
      sha256 "b29719250ce19922a3a6501cb2dafacb4fc7b86efbca2ce1b2119ddd1885029c"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.38/bitmot-linux-aarch64.tar.gz"
      sha256 "8dcfd0a270482da9dd6def25a1240d0b6293f8fb1dae20354ca62a48e39f30c8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.38/bitmot-linux-x86_64.tar.gz"
      sha256 "3779113b8c65ca58e241349d64cca20518bf6f2b22e20463cb809317b56845b1"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
