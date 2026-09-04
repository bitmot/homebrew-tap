# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.69"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.69/bitmot-macos-arm64.tar.gz"
      sha256 "354edeef7cc4a834a4e99af7acb382c04e2aba098ad166f38cf18c89e5ad79be"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.69/bitmot-macos-x86_64.tar.gz"
      sha256 "d5872919a9169af404448fde900aa077fe07be4ad007e81bfc08bcd0afdbb8d4"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.69/bitmot-linux-aarch64.tar.gz"
      sha256 "2cb1a9adbfa90e476e93a03dcb3e89f349d96f3cf6c9c9208cc174c30dae373f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.69/bitmot-linux-x86_64.tar.gz"
      sha256 "fc394c3f072b6dd3f065187d37a5bb61b1f7fa27db58d96c4877c49f6bf05649"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
