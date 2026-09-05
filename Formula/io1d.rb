# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.3.73"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.73/io1d-macos-arm64.tar.gz"
      sha256 "1572044d6759b3c5551f82513dca314c49d79a8e287b8b20714fb37d219404a6"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.73/io1d-macos-x86_64.tar.gz"
      sha256 "1731337ac657e0ca3599619deef1dad377d6642897186d2694e10d9ac7d43ef8"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.73/io1d-linux-aarch64.tar.gz"
      sha256 "a43e0346c8cdad4ee0d8f87137f28fbd5d85145c375e7434e58d25d9871469d1"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.73/io1d-linux-x86_64.tar.gz"
      sha256 "b9dd9bd24cd2e62ef0c8ac093c51d5e7e54bd9435840ddb286554c4b6a683089"
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
