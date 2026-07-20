# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# The daemon is the bitmot binary, multi-call on argv[0]: this formula adds the io1d name plus a
# brew services definition around the CLI installed by bitmot/tap/bitmot. Homebrew still requires
# a url/sha256 pair, so the bitmot release archive doubles as this formula's (unused) source.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.2.33"
  license "MIT"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.33/bitmot-macos-arm64.tar.gz"
      sha256 "b0bf532da71153a1f4036c25e647ea0ad74b6e2ae130c4d6fb21752aafe9a397"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.33/bitmot-macos-x86_64.tar.gz"
      sha256 "2ca60feaa3c1aaa09e3d5160c0697e3ca1bfcc9bdf64752cb4d778ae82d3406d"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.33/bitmot-linux-aarch64.tar.gz"
      sha256 "cf6885d867f4a85188867fd429734c16fbea139de20a3952a5a194c3461bfc55"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.33/bitmot-linux-x86_64.tar.gz"
      sha256 "1353133e939f930018b8fa528d682b1d7c774f6c6dd19e72125af8cb2b05a697"
    end
  end

  depends_on "bitmot/tap/bitmot"

  def install
    # opt_bin is the stable path across bitmot upgrades; the daemon dispatches on the io1d name.
    bin.install_symlink formula_opt_bin("bitmot/tap/bitmot")/"bitmot" => "io1d"
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
