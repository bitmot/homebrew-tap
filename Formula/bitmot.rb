# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.9/bitmot-macos-arm64.tar.gz"
      sha256 "b35169f0ef4dd4592a6aeed555dcebffdb4a6c46ca9db2eda6b74f50b4401c1c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.9/bitmot-macos-x86_64.tar.gz"
      sha256 "9066d401cf0aa7693af036452cc742e24b8a46f5bb3639711910d5c29cd11982"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.9/bitmot-linux-aarch64.tar.gz"
      sha256 "a3af03fe8c1551b5646bd57b3792c60646365f94da075644f0246421ceb747f7"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.9/bitmot-linux-x86_64.tar.gz"
      sha256 "dc7971f6424cde7a80b6c5733a312b7c6aad351a1ac03128f7ecceb89fc2a23b"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
