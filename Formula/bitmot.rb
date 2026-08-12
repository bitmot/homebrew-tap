# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.34"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.34/bitmot-macos-arm64.tar.gz"
      sha256 "a0ffef07d0e02c5941538956ad02165014a727a5098d4274a650e83934dcaa13"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.34/bitmot-macos-x86_64.tar.gz"
      sha256 "06bed34be243837d84337dc9b196fb63d8920bb866adb7f9ccbf6c328b78f2dc"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.34/bitmot-linux-aarch64.tar.gz"
      sha256 "9f5d55ec8dc11a6452b3624d2251672cc88abc37dc4d1a5d6eee24583151a0a8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.34/bitmot-linux-x86_64.tar.gz"
      sha256 "15a54723a2a77d016f2274805a56bfece9991e5242e7cdea9d89d0e46fc59d54"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
