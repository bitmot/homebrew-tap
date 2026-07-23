# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.2.49"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.49/io1d-macos-arm64.tar.gz"
      sha256 "6dc79c19745c1dba7309929b5d8c880491baf979f33d81b0d4cee11296940a4a"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.49/io1d-macos-x86_64.tar.gz"
      sha256 "d6e90ea951b1845c628a73d5035dc167ac9a65183f002e7f237b699e874b8d6c"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.49/io1d-linux-aarch64.tar.gz"
      sha256 "e278c2e5665d12d511124302ebc8930cc7b50e3d59301bac7d7577efc5c5a6b9"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.49/io1d-linux-x86_64.tar.gz"
      sha256 "61864f015ea4474de11941bd4c772af11287ef28e074d2e04d0200f65e322a1f"
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
