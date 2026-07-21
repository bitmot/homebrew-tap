# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# The daemon is the bitmot binary, multi-call on argv[0]: this formula adds the io1d name plus a
# brew services definition around the CLI installed by bitmot/tap/bitmot. Homebrew still requires
# a url/sha256 pair, so the bitmot release archive doubles as this formula's (unused) source.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.2.41"
  license "MIT"

  depends_on "bitmot/tap/bitmot"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.41/bitmot-macos-arm64.tar.gz"
      sha256 "10189f85b36c92050157fb96aa8224d8135d6198b2cb48bf18d82235b19e7539"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.41/bitmot-macos-x86_64.tar.gz"
      sha256 "0ec851927e1a7fc54c60543857550c9aaefa889a7d5c980f83cbbfa1caccb813"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.41/bitmot-linux-aarch64.tar.gz"
      sha256 "076fab529ae2fcdd321416b8d5c43a75185eee739aff0adb95d4207b020e12a5"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.41/bitmot-linux-x86_64.tar.gz"
      sha256 "c6b4611ba9ffe8fcd743c10dbbbf3d405dd33985d310a91862026c5023caba72"
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
