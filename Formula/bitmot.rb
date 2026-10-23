# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.64"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.64/bitmot-macos-arm64.tar.gz"
      sha256 "e1916ccf92349c401873c3031346b9d368c159886c6193addb7617ee1481e434"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.64/bitmot-macos-x86_64.tar.gz"
      sha256 "b548b6230c63f4a5edbbafc0dd634a7638bb397edf7459e04ff12fa6f77e062b"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.64/bitmot-linux-aarch64.tar.gz"
      sha256 "5af8f691ded69ab1973cc6aedb227cc3118d3ed516a8b1ec904234b12a9ae5af"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.64/bitmot-linux-x86_64.tar.gz"
      sha256 "b04bb914c2b49dde82220212a01f71d3a8c3478e54b2fa11ae9cbfa980ad96a0"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
