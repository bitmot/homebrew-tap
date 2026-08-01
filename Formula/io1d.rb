# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.2.80"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.80/io1d-macos-arm64.tar.gz"
      sha256 "bfdc03c1f1b77e4af825c03568114bf670db9398040a848edccd12461fdea8df"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.80/io1d-macos-x86_64.tar.gz"
      sha256 "7e95e597c86d008d68306fa1e9c0d6a755cd36ebc4c0341a4bb294ae1aa2c8ed"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.80/io1d-linux-aarch64.tar.gz"
      sha256 "13ae661c95b362ceaa34f27fe59dc9f0c6e2ba1577dd61efb160aa4e9523d8ce"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.80/io1d-linux-x86_64.tar.gz"
      sha256 "007ff97419643759308bc967e2f15124aafa53d5efbcb7cff31b1af2edf8b8a0"
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
