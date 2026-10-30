# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.69"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.69/bitmot-macos-arm64.tar.gz"
      sha256 "8079005637e9a8d37d304c9509a4b66d5eab931b71c48d186ea550fab9b45135"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.69/bitmot-macos-x86_64.tar.gz"
      sha256 "bcf3c75a45d9fc746a509b2ef76907013e38da1f45da848545b290777cd101ff"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.69/bitmot-linux-aarch64.tar.gz"
      sha256 "5bd1c1692e28032d60d4a7d1ec909df54fd6d0f8d0d6a88b5966262689184323"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.69/bitmot-linux-x86_64.tar.gz"
      sha256 "b9d49eac491187aa45a037a2548ee69a0f829bf6a73d7b622180450c3998442c"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
