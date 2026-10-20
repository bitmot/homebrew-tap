# Rendered by operations/homebrew/publish.sh from bitmot.rb.template; do not edit in the tap.
# The archives are the permanent versioned release URLs served by the gateway
# (io/io1/gateway/download/DownloadRoutesImpl.kt): a version's URL never changes bytes and is
# never deleted, so this formula keeps resolving after later releases.
class Bitmot < Formula
  desc "Publish local services to public io1.io URLs"
  homepage "https://bitmot.com"
  version "1.0.62"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.62/bitmot-macos-arm64.tar.gz"
      sha256 "65e6eb12625ba87c37e69a92397df18486152ba942435fea10dcc115482e2ce8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.62/bitmot-macos-x86_64.tar.gz"
      sha256 "81001ec83e29281ed04ec4f6e2c6e46a3b22c71f635a076912a464ec74088aeb"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.62/bitmot-linux-aarch64.tar.gz"
      sha256 "d18a89b53a7550534c0e2d6bc4e64a37b23e2743ccc8d56aad659d8f5ceb3a67"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.62/bitmot-linux-x86_64.tar.gz"
      sha256 "fae94f6c0d51baf99d276597ca5e3e509457c172bc160457f1c902f84bbfc519"
    end
  end

  def install
    bin.install "bitmot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bitmot --version")
  end
end
