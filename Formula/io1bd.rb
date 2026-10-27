# Rendered by operations/homebrew/publish.sh from io1bd.rb.template; do not edit in the tap.
# io1bd is the io1 build server: its own crate and binary (not a bitmot multi-call copy),
# fronted by io1d as an ordinary loopback proxy target. Sites are console Projects; their
# recipes arrive by desired-state push, so there is no per-site configuration to write.
class Io1bd < Formula
  desc "Build server for io1: builds and serves sites whose recipes live in console Projects"
  homepage "https://bitmot.com"
  version "1.0.66"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.66/io1bd-macos-arm64.tar.gz"
      sha256 "fb0e044965a1de2aa879e838d81e89ec05e1b11038dda3822964b9fff0cff00c"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.66/io1bd-macos-x86_64.tar.gz"
      sha256 "3b57aedc30f4f2e259f1890aec515e6c7a5cbf9b12bf9461f86681bb27ef4b80"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.66/io1bd-linux-aarch64.tar.gz"
      sha256 "f74eb6cf7638faf8e145efe2782e3797988d6c7cea84274d754c62c3aead967d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.66/io1bd-linux-x86_64.tar.gz"
      sha256 "1b015f20180a28cad40e54a343f3613ac485af15adc61dcc32977a7ded6c38ac"
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
