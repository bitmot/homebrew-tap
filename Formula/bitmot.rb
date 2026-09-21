# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.34"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.34/bitmot-macos-arm64.tar.gz"
      sha256 "0e257b27ffb75fef77fe84c29e09c32fb172d7b8c9633006b1cc9d742452d039"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.34/bitmot-macos-x86_64.tar.gz"
      sha256 "dd77414c6a1ddaf819400ebe912ad20aa4af68232af1855e01e35772b95120ce"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.34/bitmot-linux-aarch64.tar.gz"
      sha256 "95779858c16864e0704d8c9ceb61aa3ef5c9653e91128a5a6a268bbc07b9d3ef"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.34/bitmot-linux-x86_64.tar.gz"
      sha256 "8d82e5a32a7c08d6d6c4b5bbecc6eba331dc462890f908abdcb1c26611c2e32d"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
