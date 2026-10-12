# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.58"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.58/bitmot-macos-arm64.tar.gz"
      sha256 "3d9142945e9c3d99dcb0c8f9edb561cb36cca300b97a0ecb37adfba02396c5cb"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.58/bitmot-macos-x86_64.tar.gz"
      sha256 "a20c44a942ae7d74d04ad125f323433cf590028707d74af12dd40185bf220db8"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.58/bitmot-linux-aarch64.tar.gz"
      sha256 "9e60167d822238273a866095dc855c33b5a5d8d805a1fcb7039ac8c8e68038c0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.58/bitmot-linux-x86_64.tar.gz"
      sha256 "267a42c3c482d0689b3c1ac3e0caf7d10e08c51d4be8614ac6b9b88e3a8be4e3"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
