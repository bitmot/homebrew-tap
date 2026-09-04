# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.70"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.70/bitmot-macos-arm64.tar.gz"
      sha256 "c7e4cc65ca20daf4208e38e02cf1e43e0af67b33d5ed681eafced910c5770aa3"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.70/bitmot-macos-x86_64.tar.gz"
      sha256 "256bb4e544b22f27ae6ffc1ad3acc74e0ccb61097dff06b061e3dac1175ed097"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.70/bitmot-linux-aarch64.tar.gz"
      sha256 "001f014aeaf19bfa98f46b5ef51c0b64ccb46ff1019ae712278cea3370027f09"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.70/bitmot-linux-x86_64.tar.gz"
      sha256 "38134affc0fbca70e1cde07a75c637c7964a131463eb143da7061067637b74a5"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
