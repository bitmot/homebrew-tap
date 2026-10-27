# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.66"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.66/bitmot-macos-arm64.tar.gz"
      sha256 "5f23b9f59da9b19f37129bd26269664559e19171bc217508fbf2a154ec5d10e9"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.66/bitmot-macos-x86_64.tar.gz"
      sha256 "6830ad96da746b6ef91da1902ebf9fa817b45c0c267067d2b18ef52de5b09563"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.66/bitmot-linux-aarch64.tar.gz"
      sha256 "3869ec778bbad293b0bcbe37193e92c49ff701728882226a77b54ad2667f6d60"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.66/bitmot-linux-x86_64.tar.gz"
      sha256 "5de1779cb952856ca916e8c74381a48f0b3ce9b5277ecf7ed5a79fbf3c9c0ed0"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
