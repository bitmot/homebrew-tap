# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.5/bitmot-macos-arm64.tar.gz"
      sha256 "78d30a589b8c82a46a8121089859ef801ffd38cd325401b35733a7c4bbcbab75"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.5/bitmot-macos-x86_64.tar.gz"
      sha256 "409bd5eb0c121998bf0063723dde4ada7b5202494931c16f2e08cd6910e47b68"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.5/bitmot-linux-aarch64.tar.gz"
      sha256 "a1768309f03c0e0034de9d50b6d92c1a16370670989a92fcbb7f819c46ba66bd"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.5/bitmot-linux-x86_64.tar.gz"
      sha256 "76c598e3290a7586a9cf4b7e38c77ee37dbbeb47a0ec558145a0284b4683fa6a"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
