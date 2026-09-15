# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "1.0.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.13/io1bd-macos-arm64.tar.gz"
      sha256 "0167f2d0c1983cde3de0e23380e4937162a26edd07b8ef5c23da4d336469d781"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.13/io1bd-macos-x86_64.tar.gz"
      sha256 "e002f376e185af345d8a2d591f4cbb2a38af1f4cd939df6bb365e9a0b11bb4e5"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.13/io1bd-linux-aarch64.tar.gz"
      sha256 "7b10eecb20630152c1edab8f32aa2cd3d51044bb3eb67f37dd21d46de853633f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.13/io1bd-linux-x86_64.tar.gz"
      sha256 "16bc421e4be220fdec62e5e027c110a804576d65259ad46493ac8b73b4d26e86"
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
