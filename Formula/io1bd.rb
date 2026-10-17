# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "1.0.60"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.60/io1bd-macos-arm64.tar.gz"
      sha256 "26785033d6b93a731014e700d1fd98cebad4917fd87d2db6c73bb51ce6c7b8be"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.60/io1bd-macos-x86_64.tar.gz"
      sha256 "482aad0a79f7afd9eb979b2c536bf15e5c081f415c22c32aeb62b8337d1ddbd5"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.60/io1bd-linux-aarch64.tar.gz"
      sha256 "7676d4655a22d0af6e8e10fc864c0e5ba85df09dfcec0b5c43629140ace4d534"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.60/io1bd-linux-x86_64.tar.gz"
      sha256 "8b61756b88259241b90204b6a3aa79833892700612df5e2b40acd4bfa7121b0c"
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
