# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.26"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.26/bitmot-macos-arm64.tar.gz"
      sha256 "f10a2415488c61debdd9aefb1fb271075d230d6d214faf4799502cb8c80e556d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.26/bitmot-macos-x86_64.tar.gz"
      sha256 "922031f8a449a63a72ba05660b183a3e27e281a46aafa48b254fbcd19ab7b560"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.26/bitmot-linux-aarch64.tar.gz"
      sha256 "7876613aeba9104dce8ab8a5672c8d45855a3314841a961dc863210a46408b05"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.26/bitmot-linux-x86_64.tar.gz"
      sha256 "d52386ca6f9bc6710d3f4980fa6a7b4288bb399cd03ccdbeb0b67ef126657ab5"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
