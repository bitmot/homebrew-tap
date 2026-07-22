# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.43"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.43/bitmot-macos-arm64.tar.gz"
      sha256 "78933419d40b9790f0d3d748efc7b6c606d962cf00928b5d16e373c4958b9edc"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.43/bitmot-macos-x86_64.tar.gz"
      sha256 "a24281ed42723c3314a4db2f2b3f0d523fa2172780c167c98b773180703d283f"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.43/bitmot-linux-aarch64.tar.gz"
      sha256 "9810f36eaba2d12d7a85c768945c634d41dd3a7a3643e8e93ef86267edf5a80b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.43/bitmot-linux-x86_64.tar.gz"
      sha256 "4486a6546122b9ce3ff8575638182ee22040541c6b69a39f756ba47bb85a15f9"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
