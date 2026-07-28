# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.67"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.67/bitmot-macos-arm64.tar.gz"
      sha256 "235cc7a560726475d2d1764c1a3d648a6ebfe06807b2bc6769011480dcee8c8c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.67/bitmot-macos-x86_64.tar.gz"
      sha256 "8091d0332d0b8032e00833ffd2691392de470ee3d92ea8e03279290f82357e61"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.67/bitmot-linux-aarch64.tar.gz"
      sha256 "377a4cfef397caf5be7982681d2b16beea1d2560293b8a4ef43493c734140c17"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.67/bitmot-linux-x86_64.tar.gz"
      sha256 "c18d5a200147f82b7fc11114f407d3f2d84e5ea904ebbb3aec093ca926fb2bf6"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
