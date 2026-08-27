# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "0.3.59"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.59/io1bd-macos-arm64.tar.gz"
      sha256 "5390a24b7b4591d72e7ca3d88c54cb4f0e35c34709a894c8b825e7a71b08192b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.59/io1bd-macos-x86_64.tar.gz"
      sha256 "96a4962080d10a2f062c9f338a93aec6e81c56abb0478b93f49917518fb69175"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.59/io1bd-linux-aarch64.tar.gz"
      sha256 "b7848434004bc14c46c17b0edf0249921a2d33b443e27bd482dd7ec032e00f39"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.59/io1bd-linux-x86_64.tar.gz"
      sha256 "e30c5ac5e30720ee1422178211fccae628058d800fa3eabd455ebd85b5de8f04"
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
