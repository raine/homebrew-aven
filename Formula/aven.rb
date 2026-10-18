class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.50/aven-darwin-arm64-app.tar.gz"
      sha256 "484445d68f9928f73d3e561493c90547d263f0ccad4c3656b70ebf8bc6425068"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.50/aven-darwin-amd64-app.tar.gz"
      sha256 "6ee1a7dbf230c07cb901a5c0f411a7d10702377e247bb9945b658cc76c2a44cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.50/aven-linux-arm64.tar.gz"
      sha256 "85cd52b7467f5740ccfee18a186f2ea0a28ab31df3783056387c5da1d1eb0021"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.50/aven-linux-amd64.tar.gz"
      sha256 "0dc47e11186a1257d6a8ce161d272a3b6372c61400e357a625c0e243677676b3"
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
