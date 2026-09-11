# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.1/bitmot-macos-arm64.tar.gz"
      sha256 "5cc36369f0f4dd6f75b515ce169bb0c8725cae197f336e8023d2909d148d46fd"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.1/bitmot-macos-x86_64.tar.gz"
      sha256 "90ee766c41c66e9a348190671e8cc70b8c48972e405d67993df08b133ad93033"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.1/bitmot-linux-aarch64.tar.gz"
      sha256 "e9d333714ce921bded856a24063f647e723f0716938de386d93f574ea1ca7761"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.1/bitmot-linux-x86_64.tar.gz"
      sha256 "b678b8d742c37fc29399d304854b647889bee807bf5ae173da40cdc9fafcf2a5"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
