# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.7/bitmot-macos-arm64.tar.gz"
      sha256 "a991ffacf30e02e98586fba71a9990a5a4a569facaa2bb39225192eb0269a0e6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.7/bitmot-macos-x86_64.tar.gz"
      sha256 "35c5f3cd1026fce3bce8663bec2779438dc5bc81db79306c9c2681d4afaa2829"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.7/bitmot-linux-aarch64.tar.gz"
      sha256 "158eedcfa49d795b916cf1348c28b7c23bba504205c0af030f64420860630e0d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.7/bitmot-linux-x86_64.tar.gz"
      sha256 "270eaa0fd4329613f0b7b63e407475bafef0ac8abb103c420c0de58bc5a6384b"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
