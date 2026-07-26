# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "0.2.54"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.54/bitmot-macos-arm64.tar.gz"
      sha256 "e6cdfdc1d502db844368e70b4a948bf0e7a1ba521b752bf0544600f0d169c8fb"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.54/bitmot-macos-x86_64.tar.gz"
      sha256 "68ce342c04669a6873ec70e23f43b252b5e55804e00ac83b1897ee50ecd57232"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.54/bitmot-linux-aarch64.tar.gz"
      sha256 "394217da64ce13c519c5afb468775f71b614e4d3cccf11f0037a67facf10fe68"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.54/bitmot-linux-x86_64.tar.gz"
      sha256 "82f3680482ae7f1619469e00d962eb4aafcb5b6ab5d7d80544c82b24aa266211"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
