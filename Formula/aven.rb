class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.56/aven-darwin-arm64-app.tar.gz"
      sha256 "0b56304258ebe483c83576221be367e09184f949ae853dd99d8f059699c223a0"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.56/aven-darwin-amd64-app.tar.gz"
      sha256 "a29c3947c716f9bead8134f789ce337f9656b1a496a9134b2191414e6d91a038"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.56/aven-linux-arm64.tar.gz"
      sha256 "f8e36e9ef62642fa62f5a1999acafcd4bb15a11686995f23ea2b518a17f4057f"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.56/aven-linux-amd64.tar.gz"
      sha256 "ec3a8066aaa2e014bc40bd30973b9f7a8603b262efa33690f407ded00238cbb1"
    end
  end

  def install
    if OS.mac?
      # Homebrew stages an archive with one top-level directory from inside
      # it, so the working directory is Aven.app.
      (prefix/"Aven.app").install "Contents"
      bin.install_symlink prefix/"Aven.app/Contents/MacOS/aven"
    else
      bin.install "aven"
    end
    generate_completions_from_executable(bin/"aven", "completions")
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
    if OS.mac?
      system "/usr/bin/codesign", "--verify", "--strict", prefix/"Aven.app"
      assert_match "Identifier=fi.zendit.Aven", shell_output("/usr/bin/codesign -dv #{prefix}/Aven.app 2>&1")
    end
  end
end
