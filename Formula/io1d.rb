# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# The daemon is the bitmot binary, multi-call on argv[0]: this formula adds the io1d name plus a
# brew services definition around the CLI installed by bitmot/tap/bitmot. Homebrew still requires
# a url/sha256 pair, so the bitmot release archive doubles as this formula's (unused) source.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.2.42"
  license "MIT"

  depends_on "bitmot/tap/bitmot"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.42/bitmot-macos-arm64.tar.gz"
      sha256 "13d27dec329cde7576a514baf41ff6284da7c3e17a96ca8da906bb16f928edf4"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.42/bitmot-macos-x86_64.tar.gz"
      sha256 "44b4ee9eef20eba5c612539ef6c79c23043695139b4d2910b55705f429379c90"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.42/bitmot-linux-aarch64.tar.gz"
      sha256 "30471083c18036a993c1ffeee16bb5399cf211434805b08a85ce9ca4487a329e"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.42/bitmot-linux-x86_64.tar.gz"
      sha256 "b29c864e9f8d7dfb82c0eef14db50271799d446d3f73bed1d95e720412f70ef3"
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
