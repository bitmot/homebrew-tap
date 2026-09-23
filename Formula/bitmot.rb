# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.40"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.40/bitmot-macos-arm64.tar.gz"
      sha256 "6fb2738a78c6fc536f2957796f3df15da08efd39ab3a48597f2872e6bfeaef5e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.40/bitmot-macos-x86_64.tar.gz"
      sha256 "e9e668e0ff08c0cd791992ed3e21b2db3cc4168522bb10ce92c0da861f8a5d43"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.40/bitmot-linux-aarch64.tar.gz"
      sha256 "78a7e07bea89fde61b1114be38374f2625f0ead55b6bdf80f4d1f686d1395e8c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.40/bitmot-linux-x86_64.tar.gz"
      sha256 "9200c2bbb517512d021e1b6a7df723eea8944f322feaff4729720e65bae89629"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
