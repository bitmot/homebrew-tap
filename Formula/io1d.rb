# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "1.0.26"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.26/io1d-macos-arm64.tar.gz"
      sha256 "c45c60e3894a28bf5e49469ec1b8101f189d21330df4986c403f66c97c3467f1"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.26/io1d-macos-x86_64.tar.gz"
      sha256 "66e6b9ccb93be93f98d563d5eed2bf168bba3dfcb93c0cac16bc3319f39a4dde"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/1.0.26/io1d-linux-aarch64.tar.gz"
      sha256 "7e7b4300fd95d24615787f6352eddf0638ae35d0bfa45570a629581befdce46e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/1.0.26/io1d-linux-x86_64.tar.gz"
      sha256 "0f5eff1cff98cca6fe85484ef3cf6234ad6e811c4c0ae215493cc473fe61344e"
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
