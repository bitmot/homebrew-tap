# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.46"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.46/bitmot-macos-arm64.tar.gz"
      sha256 "d37c78cc9a03a1603b1bd74d3df0dc78d6f59ffac7caee9739acb8a13ad61d62"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.46/bitmot-macos-x86_64.tar.gz"
      sha256 "b78b695025e47108e98bfc91fa4e2af08eccded06bcd18bd1d7bf8ec9cb53310"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.46/bitmot-linux-aarch64.tar.gz"
      sha256 "fcfd5d71bea0ebee3dc907c64c7d92119c2925d670bd5b14fd926a9edaa06492"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.46/bitmot-linux-x86_64.tar.gz"
      sha256 "8b16213869a5b8b17d365a304c07dd52173470a8b9b5d4d1b2bfa37322e8b966"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
