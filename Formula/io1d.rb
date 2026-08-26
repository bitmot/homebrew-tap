# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.3.57"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.57/io1d-macos-arm64.tar.gz"
      sha256 "af7b94047e1b5228496be1a4d3c5644b00b6e1a1cd333dd3006b4c92978ea5ff"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.57/io1d-macos-x86_64.tar.gz"
      sha256 "65790a1516c73149d585d943448ae9d7e9feaec1907b25bc8b7fc933ab2f4a38"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.57/io1d-linux-aarch64.tar.gz"
      sha256 "d537aa69f212410f71724a9f16294735d8a1c0a1b6fadba97248b44015c92a68"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.57/io1d-linux-x86_64.tar.gz"
      sha256 "88735736249db90f0af266f457d45776a2f75b709f7099e08f2ca781c3085233"
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
