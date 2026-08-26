# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.56"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.56/bitmot-macos-arm64.tar.gz"
      sha256 "1f1e8e7b420af029fbb48b0a1f67476550c2eab21ace6b866359a14085ad042c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.56/bitmot-macos-x86_64.tar.gz"
      sha256 "e22b111315be884980a4e7ff61d707d35ca076de61acbde8570714ae3840802a"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.56/bitmot-linux-aarch64.tar.gz"
      sha256 "907e85f24168f0e675fa5f8775e45c2f9c44b26877f530aa776b10f13d8af113"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.56/bitmot-linux-x86_64.tar.gz"
      sha256 "1810d6b499f67e5a66d835207e27ca23041148fafd9dfd69c85b47b98438a846"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
