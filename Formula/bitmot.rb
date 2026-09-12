# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.4/bitmot-macos-arm64.tar.gz"
      sha256 "123ef8668598bd48e850f575e552382188e5dea7d1fda0440d287cee7c1321dd"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.4/bitmot-macos-x86_64.tar.gz"
      sha256 "61535a6a1e300bd91005008110cb3da9cf1ef66f93ffa24dc4d85a9631c0a626"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.4/bitmot-linux-aarch64.tar.gz"
      sha256 "f7c5af5412f8e11c3e8faa0b639647c2dda3379e7bb93c97c36d3de64547fa69"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.4/bitmot-linux-x86_64.tar.gz"
      sha256 "ef1df19963170a0c6a720c5af91205928e5af56c371602ef407b89e1e5cd59ea"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
