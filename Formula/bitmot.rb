# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.75"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.75/bitmot-macos-arm64.tar.gz"
      sha256 "6e88b10640b04146f380e16b059b88fa71b194a2d47ffe2b9bff4d631ae30ffd"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.75/bitmot-macos-x86_64.tar.gz"
      sha256 "eab2f9268b9b1e6f5a3cd50270d7299767fda80f9bbbae14ab7659df3a632dc0"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.75/bitmot-linux-aarch64.tar.gz"
      sha256 "2665fd9ebaab432877a82b0cb737097aacde3c070a74b2e024b0f1580ac83c8c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.75/bitmot-linux-x86_64.tar.gz"
      sha256 "b7aa1a75d701e5243fed2cbb6f90a7ca80c0079d8803845a166cd1c0881b60b0"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
