# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.2/io1d-macos-arm64.tar.gz"
      sha256 "7d011c3470d9d0928b869e2cb38710ff464a74e27c08dadde36512cc4d3d8cca"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.2/io1d-macos-x86_64.tar.gz"
      sha256 "3606f79fd790f2d1cee1db98c5f15ac3865fc5b959136bd665918bbd8c47a1a9"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.2/io1d-linux-aarch64.tar.gz"
      sha256 "4e4a420af6bf15af3bf6ccd09e5bafd33ceb7d8d220e343082e84b6709fc2f15"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.2/io1d-linux-x86_64.tar.gz"
      sha256 "511667ae3634b88a32135263d5fc231850772c1eaffd7d8d7fe87e96c88fa6d5"
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
