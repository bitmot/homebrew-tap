# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "1.0.72"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.72/io1bd-macos-arm64.tar.gz"
      sha256 "193eb8a6064a03eae84c1de7c9baf41104a8a4c916c1e0e56c1c58ce893aa854"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.72/io1bd-macos-x86_64.tar.gz"
      sha256 "8c094bc99bcea3f332aabca743afdb4686426b2ff2d86ebefc61d0efe7b81e1d"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.72/io1bd-linux-aarch64.tar.gz"
      sha256 "b40adbd723eb8ace56a8444d6591f484653fd332bd480b624271e2b5772bd7b7"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.72/io1bd-linux-x86_64.tar.gz"
      sha256 "80b995e21d1dc1edb45774462f5b68b4ec8617dc1089dbc5e757883289f71fc0"
    end
  end

  def install
    bin.install "io1bd"
    (etc/"io1bd").mkpath
  end

  # Runs as the invoking user (brew services default). Builds need git and a BuildKit-capable
  # docker on the host; `io1bd check` verifies the arrangement.
  service do
    run [opt_bin/"io1bd", "run", "--config-dir", etc/"io1bd"]
    keep_alive true
    log_path var/"log/io1bd.log"
    error_log_path var/"log/io1bd.log"
    working_dir var
  end

  def caveats
    <<~EOS
      io1bd carries no per-site configuration: every build site is a console Project, and its
      recipe arrives by the gateway's desired-state push through the io1d forward. Point each
      site's /etc/io1d publication at this server (io1bd migrate translates an existing io1d
      build setup and prints the console checklist), review #{etc}/io1bd/io1bd.conf for the
      node-scope settings (report-up identity, resource policy), then:

        io1bd check --config-dir #{etc}/io1bd
        brew services start io1bd

      Builds need git and docker (BuildKit) installed.

      Guide: https://docs.bitmot.com
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/io1bd --version")
  end
end
