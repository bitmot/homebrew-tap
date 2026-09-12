# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.6/bitmot-macos-arm64.tar.gz"
      sha256 "113998972bdee34a22151c2e1b838f4150899cb77a96b7a0c8a420ed0213e693"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.6/bitmot-macos-x86_64.tar.gz"
      sha256 "a5ab497f8504bca56083d5da59e0501bef657c7a83851d870d2b6fae0adba931"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.6/bitmot-linux-aarch64.tar.gz"
      sha256 "1a4093ddddefd196d2f068541ebea97ae0186c319904c348a69fd9bd9e609aa1"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.6/bitmot-linux-x86_64.tar.gz"
      sha256 "1acfaf5eafe70241cef4dc24ec9dea0b02803699e5c948481f3cb8689ef932ef"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
