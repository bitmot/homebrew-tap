# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "0.3.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.11/io1bd-macos-arm64.tar.gz"
      sha256 "c33c2cac60b4ffe56af381d4517770abcaceb7955728106430da902d5613a91e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.11/io1bd-macos-x86_64.tar.gz"
      sha256 "d281423aa363204ea17a304de5d70de044fd94bd64d7f991b00b10920f7a620e"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.11/io1bd-linux-aarch64.tar.gz"
      sha256 "c5c57ad13782bbdfb09f1b7765c90412bc1ad8619fdbb63d20867f90fd1894c4"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.11/io1bd-linux-x86_64.tar.gz"
      sha256 "5e63abbac0791d4df336ebf079bf3785fd38ed44eae4ca63b387ea9051d40b98"
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
