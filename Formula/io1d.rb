# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "1.0.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.14/io1d-macos-arm64.tar.gz"
      sha256 "f2b55b8543cd0264684a16976969cb181e35d54ba4878af7a318053d977cf47a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.14/io1d-macos-x86_64.tar.gz"
      sha256 "98c15cc32179d7e17cfbaf25452a42d19299eca94d557d99264c568b5597f206"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.14/io1d-linux-aarch64.tar.gz"
      sha256 "98d7f75f9a8bb06e5fbc3757372c6e3ecece69dd326635b70cd97fc0bd61cd2f"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.14/io1d-linux-x86_64.tar.gz"
      sha256 "d450dcb5900ed2c0cdcf327c3e9f0589e2f029481f614bdf2b783db4717fb414"
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
