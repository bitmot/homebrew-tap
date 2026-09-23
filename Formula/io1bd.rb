# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "1.0.39"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.39/io1bd-macos-arm64.tar.gz"
      sha256 "8b94a2f0305abf3ebc1fa4e49bd23076aa94d1e2da5e24892568bf90157e79b1"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.39/io1bd-macos-x86_64.tar.gz"
      sha256 "463d8ca1f507f07db6e4491cfabb728d6b9a5ac8d5ad0abcffc410b54ac0510d"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.39/io1bd-linux-aarch64.tar.gz"
      sha256 "cbf18832e535f97e178fd8a3e8ad9ec843fe1b4c1230cb6f07d8843a7581ec34"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.39/io1bd-linux-x86_64.tar.gz"
      sha256 "0e30959ee560a055b3d397f88eafe35190c1a5194e329cec9ab059aaae39cc86"
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
