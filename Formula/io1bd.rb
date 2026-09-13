# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "1.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.10/io1bd-macos-arm64.tar.gz"
      sha256 "180f1ff8c5917eba435c253daa1175a0d930dc36f8c9e75807ecc718628cedc1"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.10/io1bd-macos-x86_64.tar.gz"
      sha256 "87171c1c25535cbc122c3e44bef4fde376ea47fe4b73baea20f351bed0096c90"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.10/io1bd-linux-aarch64.tar.gz"
      sha256 "34d9c5a494ed470b27ba14ebef7711317a3f5f671cb1a3659850f7dffa793be6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.10/io1bd-linux-x86_64.tar.gz"
      sha256 "d8ca329ee062f65a241029f8551b4ec67cf44bddd8be6c5536aa5715cc1186f0"
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
