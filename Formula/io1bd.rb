# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "0.3.62"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.62/io1bd-macos-arm64.tar.gz"
      sha256 "06ec40d6cb13d18ec3ffd00439c271762b18b453f8b8f2c2a61e0bedb6573bc0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.62/io1bd-macos-x86_64.tar.gz"
      sha256 "c8fa0196221a73b3f3bba4d62e69cf9b87567aba28cfe91d033b9472299359e8"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.62/io1bd-linux-aarch64.tar.gz"
      sha256 "b97b11a0fbc42d68de42ebd8491cf9972c247ed9e46f3254905db1dbd83ec55b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.62/io1bd-linux-x86_64.tar.gz"
      sha256 "58669b29c506ede394e9562f0f404c679b0362f9340d3ff90312e0b74067dbc5"
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
