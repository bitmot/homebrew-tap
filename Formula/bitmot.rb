# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.3.43"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.43/bitmot-macos-arm64.tar.gz"
      sha256 "528177aa4f95b3c73da4993fe8e73e662e9d15b3ef317f37aedb021b708cc1b4"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.43/bitmot-macos-x86_64.tar.gz"
      sha256 "7bf455e6729532bb1831fad8e96e58e891bef6bf9eb39f483fabdfc4f1e823af"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.43/bitmot-linux-aarch64.tar.gz"
      sha256 "94351dc89713b0ac7a2f75070e33d7e057a1ea79bd09bd52084657a789af2dc9"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.43/bitmot-linux-x86_64.tar.gz"
      sha256 "1071739a624641e54f5f30ddba479a4df04ae0a6a781c050764d28655bffd466"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
