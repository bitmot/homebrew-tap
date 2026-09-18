# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.23/bitmot-macos-arm64.tar.gz"
      sha256 "9c6308c1ec70978844994e027669f01397062564b292f626c233a40787b4a736"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.23/bitmot-macos-x86_64.tar.gz"
      sha256 "5d30338c36f01082fefe8167b783a4dbcb8d88b33ec41e22343c256dc5616533"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.23/bitmot-linux-aarch64.tar.gz"
      sha256 "b201dd26fa6fc1e8689d21ba9567128d7676f5937dc5065792e902b02584eb40"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.23/bitmot-linux-x86_64.tar.gz"
      sha256 "66013266320ec95d5633d4e840c331153b3b039e921cddc7d9dee163865365c1"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
