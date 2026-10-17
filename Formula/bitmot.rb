# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.60"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.60/bitmot-macos-arm64.tar.gz"
      sha256 "6bf31fbae7f2e2d996e0ccb60b21548077b9f2d3bab1059518bbb2e278e8b92d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.60/bitmot-macos-x86_64.tar.gz"
      sha256 "62e33d225e06d8dbc3af2323658e6a609250c5d86b9907a8d73736643b372fff"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.60/bitmot-linux-aarch64.tar.gz"
      sha256 "2be61f3fb17601f985a30c4fa6983c0c36a079897b4f7736bbceb3fd3ea92cac"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.60/bitmot-linux-x86_64.tar.gz"
      sha256 "2efb0191bd8f297563b7bebd9d041172200dff8e21b12ee78150cf324fd62d5d"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
