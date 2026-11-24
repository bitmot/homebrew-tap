# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.72"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.72/bitmot-macos-arm64.tar.gz"
      sha256 "4ac66b5498cb2dc308c657985d5dc59574f4dc27a18aa3f03a785039b6712fcc"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.72/bitmot-macos-x86_64.tar.gz"
      sha256 "5f4550dccb0aadcae37b735ecf3b53b9728c5552269563063a90bee8334866b8"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.72/bitmot-linux-aarch64.tar.gz"
      sha256 "b254b677a888ccfa42c6c226c15200bb604ab996e13789681cd948d044d9723b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.72/bitmot-linux-x86_64.tar.gz"
      sha256 "c8163bd13f273f3ebd9013c2eadbe52c53af8d57f482ba14cc7c05be55945ebc"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
