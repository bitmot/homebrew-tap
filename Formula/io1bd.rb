# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "1.0.32"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.32/io1bd-macos-arm64.tar.gz"
      sha256 "682574848c782c8d1fb35d04370fffc71fd4ed632be6e50faaf8f158dd766c0e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.32/io1bd-macos-x86_64.tar.gz"
      sha256 "d6228bd368c7c8a05723fd808411de0ad7e71574f9a002fca2e03f8b5e2c1ba4"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.32/io1bd-linux-aarch64.tar.gz"
      sha256 "9f6a317b26495dc72df0459feeb9de5b2bf126a45be907c89b50bfc8dde63505"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.32/io1bd-linux-x86_64.tar.gz"
      sha256 "8607c70e6375a162e0d86579df5090a2f60e889326017fdde7d06a4f2cd34139"
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
