# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.68"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.68/bitmot-macos-arm64.tar.gz"
      sha256 "407e83867210973126a11cd97cb223ef24e9e46778cb5bd6f621f65a620c6051"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.68/bitmot-macos-x86_64.tar.gz"
      sha256 "448775aa8c2c475413f653e5273eb39d57d7f7b7d73ed01c43ab98f9a599d831"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.68/bitmot-linux-aarch64.tar.gz"
      sha256 "a6aeca480083bd9359bdee9e25c0601501bb6c675c1c4f4bfa8c1f4e4c3a5445"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.68/bitmot-linux-x86_64.tar.gz"
      sha256 "64dffd804516831ad6f634064995f69861359f4949c3dd8b72375adbfd9f0984"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
