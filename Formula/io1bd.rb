# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "0.3.51"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.51/io1bd-macos-arm64.tar.gz"
      sha256 "18f884462506a5be05f088eed62d7c8325df14e84cef7e6c624a65a8c309c829"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.51/io1bd-macos-x86_64.tar.gz"
      sha256 "23630421fab4c2aa585d0d5c3ee531a6a10320d3e9bcceed8bb5a2e2063f618c"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.51/io1bd-linux-aarch64.tar.gz"
      sha256 "f771ad4a2f9035f9d47456e4794061b19eccb3031ee5e2cd29b3d609dae0c28e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.51/io1bd-linux-x86_64.tar.gz"
      sha256 "a45c6a408d6a06c793b20e7dd2519a402648c1eb9a0eb5ff2da13f25adc1e9d7"
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
