# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.3.25"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.25/io1d-macos-arm64.tar.gz"
      sha256 "a34fd361b3826f6ed587858c2e195bfd903b05f09d2252f097e92bbb136dafb2"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.25/io1d-macos-x86_64.tar.gz"
      sha256 "0824ba0971179af429de0e1b2b960e9be79a5730080b2eeadced9c111b3e525b"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.25/io1d-linux-aarch64.tar.gz"
      sha256 "736b5af5a86dbbe4f3eab5c928dd07fd1f13f9e7f8353f436b92dcbb62708933"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.25/io1d-linux-x86_64.tar.gz"
      sha256 "bdfa1ed4c530435985f8e70035147d4c51ae88a15036c1bc11ee442bdc4f1f8a"
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
