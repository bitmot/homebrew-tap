# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.10/bitmot-macos-arm64.tar.gz"
      sha256 "b66a7e3f63e90a8db40c101c970be9d65f2a1cbd4c78a78101ac1fc9f8fc87b6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.10/bitmot-macos-x86_64.tar.gz"
      sha256 "6107ff42d88b8bdc70038420e4b793f16ababb601c8489858a43cb5f793cbee0"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.10/bitmot-linux-aarch64.tar.gz"
      sha256 "9c2edfb8785869d1b342f4b8696b5b683546e22d1140d46a742c1c7226567b4e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.10/bitmot-linux-x86_64.tar.gz"
      sha256 "834a6290fc855725af4fdaa562b8bd16cadbd81376768df1de75e866226527bb"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
