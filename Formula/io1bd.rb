# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "0.3.79"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.79/io1bd-macos-arm64.tar.gz"
      sha256 "af4eb9b5b81ddf95b95dac30ad9722849189e0e2e12ca0daad69a99d86dd5947"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.79/io1bd-macos-x86_64.tar.gz"
      sha256 "bc12278a2cc2417b78736ede58146b8f906a749190f8aa21d71388ab55845b10"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.79/io1bd-linux-aarch64.tar.gz"
      sha256 "2dfec0227c92b35d7107f29d72c03e2fb18a5abf73847616efac35f6806948cf"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.79/io1bd-linux-x86_64.tar.gz"
      sha256 "b946b7c9efe4e085ff8616dc59ac9fb4b6f791ea3c453a0badb59732b1c27ae4"
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
