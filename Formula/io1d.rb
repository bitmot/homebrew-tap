# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.3.60"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.60/io1d-macos-arm64.tar.gz"
      sha256 "79b84e3de1a36a673c1d722dc7bf2446c7b73ccddcda34fb5c1034ad4b775059"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.60/io1d-macos-x86_64.tar.gz"
      sha256 "58404372f71d90bb22b2c974add0d9fc08e2de773eedbd47aa56c74793cd1547"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.60/io1d-linux-aarch64.tar.gz"
      sha256 "8d00626a8c8aaeda40c4c87baed36dded3b6bf21aac52d92e972f41b5a196536"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.60/io1d-linux-x86_64.tar.gz"
      sha256 "35cf19db68ab1473a2c0324b62739596c2d4a88a2fc64676fecea28095932bdf"
    end
  end

  def install
    # A real, independently versioned binary named io1d; the program dispatches to the daemon on the
    # io1d name. No symlink into the bitmot keg, so `brew uninstall bitmot` never breaks the daemon.
    bin.install "io1d"
    (etc/"io1d").mkpath
    (etc/"io1d/conf.d").mkpath
  end

  # Runs as the invoking user (brew services default), which matches the credential written by
  # `io1d authorize` below. sd_notify is a no-op outside systemd; events log to stderr.
  service do
    run [opt_bin/"io1d", "run", "--config-dir", etc/"io1d"]
    keep_alive true
    log_path var/"log/io1d.log"
    error_log_path var/"log/io1d.log"
    working_dir var
  end

  def caveats
    <<~EOS
      Authorize this machine and add publications before starting the service:

        io1d authorize --config-dir #{etc}/io1d

      (A warning about a missing 'io1' group is harmless here; the service runs as you.)

      Then define each site as a [[publish]] block in #{etc}/io1d/conf.d/*.toml,
      check the configuration, and start the daemon:

        io1d check --config-dir #{etc}/io1d
        brew services start io1d

      Guide: https://docs.bitmot.com
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/io1d --version")
    assert_match "config OK", shell_output("#{bin}/io1d check --config-dir #{testpath}")
  end
end
