# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.31"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.31/bitmot-macos-arm64.tar.gz"
      sha256 "3858fdd278aa5c129d16bd9055425a79a2036e283f0303d25ebf68db3375ce63"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.31/bitmot-macos-x86_64.tar.gz"
      sha256 "95e1e3052776f7cbe389dd7eba22d5e70e18efdf38c26e59cdaa4a8aa7af0e48"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.31/bitmot-linux-aarch64.tar.gz"
      sha256 "a787aaa9a140134016ddd19e570f148315264abd13be071fb4291cf5048367ea"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.31/bitmot-linux-x86_64.tar.gz"
      sha256 "3930d8a1d81e37ad6682afa60553080dc47158536ad11123ccc3883fa593bc34"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
