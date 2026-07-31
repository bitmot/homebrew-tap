# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.77"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.77/bitmot-macos-arm64.tar.gz"
      sha256 "18c046e039d86b6d3a4ff3879dc570efbfb70fbdf43745a8bd5fced027ec5f26"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.77/bitmot-macos-x86_64.tar.gz"
      sha256 "bbf3b5b7406102ed304ad9fed2994ca99dbc7756baacce144dd6d7b05c54fccd"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.77/bitmot-linux-aarch64.tar.gz"
      sha256 "304412dab73dc1ddb23fd7a3d8f50d20d836888db78447786ced017a303684be"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.77/bitmot-linux-x86_64.tar.gz"
      sha256 "a9394b520ab20f43766ae6d4529d2dd9dabf92bfdba2c1653ddeec6d44813596"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
