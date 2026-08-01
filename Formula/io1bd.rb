# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.1/io1bd-macos-arm64.tar.gz"
      sha256 "a386240d28fa08ec7af84d76e1d6bd58d7aa2cf5540d92d1338a3a0fa3bdb1e7"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.1/io1bd-macos-x86_64.tar.gz"
      sha256 "955958b97ff06202a940d32543a99220a091bead35784d4eb73f92a1bb357d32"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.1/io1bd-linux-aarch64.tar.gz"
      sha256 "8c5a0b8652d99898191809d1fd5fd895922304952e971c640c5f387961a13552"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.1/io1bd-linux-x86_64.tar.gz"
      sha256 "9bce19bafbdea4fafc154ea440a8a99cb3143b108c6b7828bb396a1e0c4b2030"
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
