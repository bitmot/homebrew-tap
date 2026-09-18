# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.27"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.27/bitmot-macos-arm64.tar.gz"
      sha256 "652c51f98e21e9985f224326ed88f2fc782a5131e01d592bf6b51bbc0c370521"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.27/bitmot-macos-x86_64.tar.gz"
      sha256 "74b5bc924bd73954b4d74ff4561a743828ddf43e26f620c51047d5b2dc1e1dfa"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.27/bitmot-linux-aarch64.tar.gz"
      sha256 "4f74b8c0c7e02f8719a2424b5b330eeea90af718f2b98b2a300f94bfda06c3a1"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.27/bitmot-linux-x86_64.tar.gz"
      sha256 "ddae6a22f2fee0f1785cb0d8dcd328a0934bb88b5299ff37d1c0eac81db65e2d"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
