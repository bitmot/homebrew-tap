# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.69"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.69/bitmot-macos-arm64.tar.gz"
      sha256 "0c926a5c367e9fb4f6944349add91a0c02d0c3108979913ceec156a1bba7e92e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.69/bitmot-macos-x86_64.tar.gz"
      sha256 "9812dd481ff7ed2f2639e8876ae0f1fbd737ad5fe6930bc43108861ce719df1a"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.69/bitmot-linux-aarch64.tar.gz"
      sha256 "f5f6b65f295dc06e5966e8cd0b7f22307d0304aef259fda81a580802d40ca6d6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.69/bitmot-linux-x86_64.tar.gz"
      sha256 "51de75cfd99b968a07e6850a28903d4de9322800a9e2e974a6de714990dfc347"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
