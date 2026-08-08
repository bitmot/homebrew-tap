# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.3.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.9/io1d-macos-arm64.tar.gz"
      sha256 "96c7115032fe70b2ceae153c6bf823b99f02f4d1e2b459017599a6ba34d3c8c0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.9/io1d-macos-x86_64.tar.gz"
      sha256 "f3828f262168119afea35a0a019227330dbed18ebe42edd5d197d428179c7429"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.9/io1d-linux-aarch64.tar.gz"
      sha256 "467dad15450c8ad4c2308050d7716a8970dd9de0d09a928d6128953dc93a8c18"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.9/io1d-linux-x86_64.tar.gz"
      sha256 "0fa629d60a081d5efc5343f6680bc8a36b6d09846f53bfa0b57eb16b396fb510"
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
