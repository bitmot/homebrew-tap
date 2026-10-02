# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.50"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.50/bitmot-macos-arm64.tar.gz"
      sha256 "65924a268c86ef9063b47df3314eee64915b60b43508d18d56f763ec9a313407"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.50/bitmot-macos-x86_64.tar.gz"
      sha256 "d5397e15cde01ae8ffd7eb2b64583a170b474655f809cba4041e084c32062204"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.50/bitmot-linux-aarch64.tar.gz"
      sha256 "d38e9a627dde79c8cd9dd3b68dcbb5043adb541089fbdca41cb621489dd7e4d0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.50/bitmot-linux-x86_64.tar.gz"
      sha256 "586217d63072a64781d79e664caff7d5be11eec07208a9c1c8519fcda44aba71"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
