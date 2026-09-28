# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.45"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.45/bitmot-macos-arm64.tar.gz"
      sha256 "58fb3f3d0d4dec1deabbdfdea052dd77a1689efe8ec099a9823b8cab026c8046"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.45/bitmot-macos-x86_64.tar.gz"
      sha256 "0a1dbf00b909f102bc956cff131e9cb8a00b5e679a187ef7115ac97213c2b682"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.45/bitmot-linux-aarch64.tar.gz"
      sha256 "044951a0c3e4849eaae4d175a80ab34e2bab695b551f29b2cefda5f67eb6a447"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.45/bitmot-linux-x86_64.tar.gz"
      sha256 "93de28cc64f5911a38e261cd86cc8a1f02a359cc4d91591b25bf4debe1087e51"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
