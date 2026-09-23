# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.39"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.39/bitmot-macos-arm64.tar.gz"
      sha256 "c26c89898fefe6762f6f31fae9d30c6f9d4f40a63820f1669f868e12ad1ede35"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.39/bitmot-macos-x86_64.tar.gz"
      sha256 "eb04fb90feb04bcd8e6ca50e6a59b9d92b679af46c4cbaa639f06cb87cc9fe71"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.39/bitmot-linux-aarch64.tar.gz"
      sha256 "941e47c8b24a7f3df8412b92c2e77c25e1316aecf788e01bc96c83eab356b437"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.39/bitmot-linux-x86_64.tar.gz"
      sha256 "6e05cb94e30082d4346058a97e23fb426609b49e111391bda8da41d39d43eb24"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
