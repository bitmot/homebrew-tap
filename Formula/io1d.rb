# Rendered by operations/homebrew/publish.sh from io1d.rb.template; do not edit in the tap.
# The daemon is the bitmot binary, multi-call on argv[0]: this formula adds the io1d name plus a
# brew services definition around the CLI installed by bitmot/tap/bitmot. Homebrew still requires
# a url/sha256 pair, so the bitmot release archive doubles as this formula's (unused) source.
class Io1d < Formula
  desc "Publishing daemon for io1: keeps configured local services published"
  homepage "https://bitmot.com"
  version "0.2.43"
  license "MIT"

  depends_on "bitmot/tap/bitmot"

  on_macos do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.43/bitmot-macos-arm64.tar.gz"
      sha256 "78933419d40b9790f0d3d748efc7b6c606d962cf00928b5d16e373c4958b9edc"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.43/bitmot-macos-x86_64.tar.gz"
      sha256 "a24281ed42723c3314a4db2f2b3f0d523fa2172780c167c98b773180703d283f"
    end
  end

  on_linux do
    on_arm do
      url "https://bitmot.com/download/releases/0.2.43/bitmot-linux-aarch64.tar.gz"
      sha256 "9810f36eaba2d12d7a85c768945c634d41dd3a7a3643e8e93ef86267edf5a80b"
    end
    on_intel do
      url "https://bitmot.com/download/releases/0.2.43/bitmot-linux-x86_64.tar.gz"
      sha256 "4486a6546122b9ce3ff8575638182ee22040541c6b69a39f756ba47bb85a15f9"
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
