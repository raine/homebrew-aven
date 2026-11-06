class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.55"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.55/aven-darwin-arm64-app.tar.gz"
      sha256 "e00aa45942a1ce24db1198553556b1ce6950c62a33b375871c531bf5410353ca"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.55/aven-darwin-amd64-app.tar.gz"
      sha256 "d9620e7d04d447dc7d55c895a2c42d13005bc95305058e5c6998b63e545a21b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.55/aven-linux-arm64.tar.gz"
      sha256 "39b0d89db6e6dde2deb0247cefe7fa10b7ddfcb7cc2fb6b12fd678d70a46da5f"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.55/aven-linux-amd64.tar.gz"
      sha256 "28a186d59769f29c92c6ea2b385fcd4fd6a1844a7b0305c08cb1a1f385ff15b3"
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
