# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.20/bitmot-macos-arm64.tar.gz"
      sha256 "68cfe74af17147a07f82bfcbeb49a5ce40428489ca45ff6b7f48e387bcb7047a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.20/bitmot-macos-x86_64.tar.gz"
      sha256 "af49bee1ce64f08cd594f2bba7e9f032a0fa81f5e9bbe4ebc661f8c6ee61c423"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.20/bitmot-linux-aarch64.tar.gz"
      sha256 "1a6f367e2293a471d77046a6cdbb19b26041ab5135f81bbdaf903cf2e2b5941b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.20/bitmot-linux-x86_64.tar.gz"
      sha256 "57ca10444c1b0dd329790cff9da2877275d68fcf3c7076393e0a37b2f8d22e35"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
