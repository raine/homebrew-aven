class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.53/aven-darwin-arm64-app.tar.gz"
      sha256 "cc15bf2c69713cf6d0e106c521d7199a70e5ff12b8e233284b3faba54ce1745b"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.53/aven-darwin-amd64-app.tar.gz"
      sha256 "e547e40bad987c9892777683307a19603fb563daebb80be063c2667ba162d4b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.53/aven-linux-arm64.tar.gz"
      sha256 "112b892639c2128f0280001d698af1c4525e00a6848852381c7e63105d037fd2"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.53/aven-linux-amd64.tar.gz"
      sha256 "79c98502180e144dab1a4f7b07636c4b81e7dc8262db074d05079def54107b77"
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
