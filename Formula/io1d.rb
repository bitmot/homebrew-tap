# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# The daemon is the bitmot binary, multi-call on argv[0]: this formula adds the io1d name plus a
# brew services definition around the CLI installed by bitmot/tap/bitmot. Homebrew still requires
# a url/sha256 pair, so the bitmot release archive doubles as this formula's (unused) source.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.2.40"
  license "MIT"

  depends_on "bitmot/tap/bitmot"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.40/bitmot-macos-arm64.tar.gz"
      sha256 "80a653ada4e411a501823fa89769e2fa5c4b7f5cdc5482ae4b9c9028ef10740d"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.40/bitmot-macos-x86_64.tar.gz"
      sha256 "17e3fe2a14850fdaa16dac6c3018263f6bd64d55cdd6d766ff8fc95316e2a65a"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.40/bitmot-linux-aarch64.tar.gz"
      sha256 "5c3f5cfb01a0f944fa19ef1eb36ce64c34210473d7976da6edb7206306c3fbb0"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.40/bitmot-linux-x86_64.tar.gz"
      sha256 "033d34fa9a30abe77b2841ef612f844dac300ed617926c59c5b94d0318b603b2"
    end
  end

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
