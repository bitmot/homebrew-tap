# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# io1d is the io1 publishing daemon. It is the same program as the bitmot CLI (multi-call on
# argv[0]), but shipped here as its own physically separate, byte-identical binary so it installs
# and upgrades independently of bitmot - with no symlink into the CLI keg and no dependency on it.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.3.31"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.31/io1d-macos-arm64.tar.gz"
      sha256 "182e9faf401f436e4c901f5b66f3fd6b7646d2898602ba4eae10e6409f2896a8"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.31/io1d-macos-x86_64.tar.gz"
      sha256 "d089abf71f97fdc1ae5470b671893192befe15007a181d41498541c12d234297"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.3.31/io1d-linux-aarch64.tar.gz"
      sha256 "3c8c2733056056f733f53f960eeb708b493b0b4074040464b6f2102f8386c78d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.3.31/io1d-linux-x86_64.tar.gz"
      sha256 "0c97d64a750ee79ae307f94040b0d3c885977ad89bc83e62a2f117c66e289fc4"
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
