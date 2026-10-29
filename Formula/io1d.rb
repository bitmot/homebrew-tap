# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "1.0.68"
  license "MIT"

  on_macos do
    # The macOS floor every Bitmot artifact shares (MACOS_DEVELOPER_ID_SIGNING.md D14); inside
    # on_macos so the formula keeps its Linux support.
    depends_on macos: :sonoma
    on_arm do
      url "https://bitmot.com/download/releases/1.0.68/io1d-macos-arm64.tar.gz"
      sha256 "dd2397bc78ba63adebf9309471aa6c65eea9a38295a39e263500d3a14dcfbcf4"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.68/io1d-macos-x86_64.tar.gz"
      sha256 "e848137e0b04b6ebb7210a85da01794961f668d715bac8ea169f3c5e9b0a5426"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.68/io1d-linux-aarch64.tar.gz"
      sha256 "d731bd3bbf98b431146d209aee913152d33b0774d9f661a43cd965d3f6f2a60b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.68/io1d-linux-x86_64.tar.gz"
      sha256 "59628de56cccba5e7744417d10809dd3971113c6dfdc59d4607de3022d8415cf"
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
