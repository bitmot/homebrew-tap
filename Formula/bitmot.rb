# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.33"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.33/bitmot-macos-arm64.tar.gz"
      sha256 "c37b10f79ca25bbb764e2e57063ff7f897d7c9fe168d7dc31a23c1a61234d15d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.33/bitmot-macos-x86_64.tar.gz"
      sha256 "a7f346ea598ca6d81d6b87a9a482b6ebd8edf433362b314c401b3d7dbd392c0d"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.33/bitmot-linux-aarch64.tar.gz"
      sha256 "f9f5b8f545cfe641ac346705887af3630c4afe7c4271a7412f203f645840103f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.33/bitmot-linux-x86_64.tar.gz"
      sha256 "efbb378ff78cd558a557284ec56059b10a211515719e61548e5ac7e7e229746e"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
