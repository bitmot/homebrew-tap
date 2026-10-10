# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.56"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.56/bitmot-macos-arm64.tar.gz"
      sha256 "7039771d93995516065830034310c4059eb23e4ca1e87d27b70b2639bd0d5ee1"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.56/bitmot-macos-x86_64.tar.gz"
      sha256 "8843564b0d3e0169a54dc2de5a48c8b736a1406ea12822458bd95e9ecfa1db15"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.56/bitmot-linux-aarch64.tar.gz"
      sha256 "b76a12849f9ff6a986882a6889350f1be356f9a835673570e034591a74bc55c7"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.56/bitmot-linux-x86_64.tar.gz"
      sha256 "fde7ea3c07061fe4a7a4dc4264afd775808e8f2b9ea28b65a2bd00ead2448aa6"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
