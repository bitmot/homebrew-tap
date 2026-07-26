# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.55"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.55/bitmot-macos-arm64.tar.gz"
      sha256 "6c8da5d4d18a9e62357a644d6b20cf6e9e49005f042bd73e66deafcc596fcd94"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.55/bitmot-macos-x86_64.tar.gz"
      sha256 "5e6c225adf5740ff396b0ef0f8ecbc1e6dbaea920b82a79141c2c8cf57b09593"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.55/bitmot-linux-aarch64.tar.gz"
      sha256 "6967af9bde90ab5d423c7e437e4201ab8ebd92b761e4a4d63ab41700f3d3ee93"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.55/bitmot-linux-x86_64.tar.gz"
      sha256 "0416d4003000de71611ac49fd73441a2f139d6f333dbdf5edfbf8334940d6886"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
