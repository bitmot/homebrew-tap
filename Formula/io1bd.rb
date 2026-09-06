# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "0.3.74"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.74/io1bd-macos-arm64.tar.gz"
      sha256 "ebe15b1c1844a30bdc548d4e69067fff8d5356b17eb67a037fe8e546d07e5df3"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.74/io1bd-macos-x86_64.tar.gz"
      sha256 "03a70b600241d6114b79ee0ff8d47511e2a4d77a615266b0967191f316691245"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.74/io1bd-linux-aarch64.tar.gz"
      sha256 "e314ce852ef8b69191a09a7174d38bef55b5580e4687d3e2491124612e31c4ec"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.74/io1bd-linux-x86_64.tar.gz"
      sha256 "a0035321b9f5466702a7a94e0f90555824e390099d907f87233e949575cfeef1"
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
