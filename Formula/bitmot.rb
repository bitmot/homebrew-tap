# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.9/bitmot-macos-arm64.tar.gz"
      sha256 "4a4008b1d50fa14c1060e4b013619caea59078ecd3d4e266d62257317a62e8d5"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.9/bitmot-macos-x86_64.tar.gz"
      sha256 "b2e95439834615a42b6e2f5d33cd012b9b51b33ee74ef41409b2b9fee8c770ae"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.9/bitmot-linux-aarch64.tar.gz"
      sha256 "8790c1f939336bdf714cc2a219d12d54586b23268b1d869f47f49a7085c6a71f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.9/bitmot-linux-x86_64.tar.gz"
      sha256 "ad8e2cf597a1d708d0f960420a44cbc8adcdf855bfbf505fcdef91f364c7df29"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
