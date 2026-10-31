class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.52/aven-darwin-arm64-app.tar.gz"
      sha256 "7ddb2780920b68f040d6933e0574e604de104060726e6d110cddf1b36afffc17"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.52/aven-darwin-amd64-app.tar.gz"
      sha256 "84b0c101bf1c2ab934f27c524607333d8dd89d949098f2ddb0aa884133dc647e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.52/aven-linux-arm64.tar.gz"
      sha256 "fda6ec354a2451ea11bfbfb0da539d5fee3ac9aff1f0202347c44d4ae708d974"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.52/aven-linux-amd64.tar.gz"
      sha256 "14677900ea48138d0cf1da0123f2fb4a240b47b6a89dd75028e2a0bee2df1a63"
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
