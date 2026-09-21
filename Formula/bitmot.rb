# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.35"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.35/bitmot-macos-arm64.tar.gz"
      sha256 "1cc4c20a011c79a27adb8925abe920e30ee38d8f8c2745f565e5b5bdb4a9de08"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.35/bitmot-macos-x86_64.tar.gz"
      sha256 "4c822a75ea907fa53118843e6b8d04fd5c398711b0fa767244f248348e37dd25"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.35/bitmot-linux-aarch64.tar.gz"
      sha256 "236a80a657654e089aeee9fe48a35b21562e881a19250c47d195388a83079615"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.35/bitmot-linux-x86_64.tar.gz"
      sha256 "8774817f41b4f112d8e64373a5cf4b99166865fd5d0b2f67d81104221f3df53e"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
