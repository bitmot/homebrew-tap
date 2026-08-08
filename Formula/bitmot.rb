# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.12/bitmot-macos-arm64.tar.gz"
      sha256 "25c39ff7cb5da4a80e641aa39709bda311e2e8f258c89472698c55fe4f46d15c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.12/bitmot-macos-x86_64.tar.gz"
      sha256 "f6c83d9a93fcb82a82188f20cc9e47e1c285f695ace2fa551cb3676e5da40f19"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.12/bitmot-linux-aarch64.tar.gz"
      sha256 "8d8493aeed7d9486759fb5beeb7a9a59e85d468f170732c30179a1faebcaf679"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.12/bitmot-linux-x86_64.tar.gz"
      sha256 "3ee86a081a0362ada55605d1ecc47a36bac975fdc5cf0ea0eecb9864031e7d70"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
