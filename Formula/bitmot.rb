# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.22"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.22/bitmot-macos-arm64.tar.gz"
      sha256 "b1c1361a195f29b8c9575421454cd1c283a9afe1a4eb55b0dd358adce2881f5e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.22/bitmot-macos-x86_64.tar.gz"
      sha256 "b10236f54374dd9867a2a3e2b907f032281bada3c7b8cb31e8d743e60c3a3803"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.22/bitmot-linux-aarch64.tar.gz"
      sha256 "60139a8dcb7d6a09ce5e1ce03b9a6ee9c9ef213e0d06b68a5d84214cb86171c1"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.22/bitmot-linux-x86_64.tar.gz"
      sha256 "795bd50c53d495cec1d5a829cdfc261fa41c0de2e2985d670c5b5debc08f139a"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
