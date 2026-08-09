# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.16/bitmot-macos-arm64.tar.gz"
      sha256 "0fe89560c6ea40094d49deb2eb3dbcacd94bf33614f92dda42381f66aeb35084"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.16/bitmot-macos-x86_64.tar.gz"
      sha256 "37348b9966ac396fffe2baa8b9b201131118e04ae44aa34a53b7e5046077d85e"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.16/bitmot-linux-aarch64.tar.gz"
      sha256 "684ea8d078a11d6eb31fa2b0bf2a12f59ce6b004665f1b29501aef9429716cea"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.16/bitmot-linux-x86_64.tar.gz"
      sha256 "dd9e33783dbb82c1ccc80a22aa006255fd3267d9efe0b4b267382830350d7a13"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
