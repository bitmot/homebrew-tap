# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.7/io1d-macos-arm64.tar.gz"
      sha256 "13071881e21caa45670133487ddae1f5b4125028bdd78e5c6fa29c377c2e7b18"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.7/io1d-macos-x86_64.tar.gz"
      sha256 "a8e916c67da8a477ac43bfcf9edc55c0a08d55e59ed862ba2344595a1df0b76f"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.7/io1d-linux-aarch64.tar.gz"
      sha256 "e48d5d78a52c38d522244750c008fdd46961edf8bb41e11b5b2d7e7726fb06ba"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.7/io1d-linux-x86_64.tar.gz"
      sha256 "96f1027201ec1cbe73a727e07ca919fd1e95b67c49671c9982795b55a6a12a81"
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

        io1d authorize

      (The config directory #{etc}/io1d is derived from the binary, so no --config-dir is
      needed. A warning about a missing 'io1' group is harmless here; the service runs as you.)

      Then define each site as a [[publish]] block in #{etc}/io1d/conf.d/*.toml, check the
      configuration with `io1d check`, and start the daemon. Two postures:

      Publish-only (runs as you, starts at login):

        brew services start io1d

      Always-on (a root LaunchDaemon: starts at boot before login, survives reboots
      unattended, required for private-network membership):

        sudo io1d service install

      Guide: https://docs.bitmot.com
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/io1d --version")
    assert_match "config OK", shell_output("#{bin}/io1d check --config-dir #{testpath}")
  end
end
