# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.72"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.72/bitmot-macos-arm64.tar.gz"
      sha256 "4f8038dc9b982f1efc09f05358a90293ec23360c5d706bf479f76b5ec02c99ac"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.72/bitmot-macos-x86_64.tar.gz"
      sha256 "e9e7319c6ec4ceeb7b5d9fe7d4ee922e430a2802f76cf6e58b8e44c915df8e1e"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.72/bitmot-linux-aarch64.tar.gz"
      sha256 "771d07b6d6833fe3d6ca0c56d8e6ed8666bd02c9056e1c7e8019f46dd61cb5e3"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.72/bitmot-linux-x86_64.tar.gz"
      sha256 "6026ad57dafb5471bab2e668c970e6f195d88b359a89aeeb28d31988987a2da6"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
