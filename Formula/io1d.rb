# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.3.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.12/io1d-macos-arm64.tar.gz"
      sha256 "6b7a3c2abf8b6ccf26ff903439d1259b34b9d7ab01b50e1af3415102b5d64d4b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.12/io1d-macos-x86_64.tar.gz"
      sha256 "fee341c68e19dacf1622f5e86fa5f3e9377afcdf27927f47974a11305b1a2c1e"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.12/io1d-linux-aarch64.tar.gz"
      sha256 "c1ce256181104a7a579adcc5829d8f3a91030ecd5f097b7ed72c8e8d8448f4e5"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.12/io1d-linux-x86_64.tar.gz"
      sha256 "85cfdf4f1cb9315568453ab164a5c1042255bf487ce57073787a0c5cea39c9ef"
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
