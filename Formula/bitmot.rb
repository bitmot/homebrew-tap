# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.67"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.67/bitmot-macos-arm64.tar.gz"
      sha256 "b4fb88962831027bfd9c0e1e625cb0beafb27f7a7e11582ac0c1ad5fd1108e89"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.67/bitmot-macos-x86_64.tar.gz"
      sha256 "c0bfbf5ef71452e03db45865330d64d999a0835e1160f9ea8391bb143abca652"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.67/bitmot-linux-aarch64.tar.gz"
      sha256 "2fc8a5374d3332bd578898f0ad743bf51949a1ede93fffffc55f819055ec6143"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.67/bitmot-linux-x86_64.tar.gz"
      sha256 "4734392fb3085c96324c45b4253d9da579cb8d303962d8d10f0fc944f99daba9"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
