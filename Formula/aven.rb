class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.51/aven-darwin-arm64-app.tar.gz"
      sha256 "d7b8dd49594de03978d155dd50e0437fd321b675205378316c153ea60084c16b"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.51/aven-darwin-amd64-app.tar.gz"
      sha256 "0faebbbbaad5e3b118db3d494349b43a3358f21df286784ecd918a98736107da"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.51/aven-linux-arm64.tar.gz"
      sha256 "520b89360d214f04f480666caf68f149175e91302731cfd888f43aa0d4dd6bbd"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.51/aven-linux-amd64.tar.gz"
      sha256 "7f8cfc42e7308745a9cb66953b7fb7c752fd5d9863781e2be7d6b2b01ba7a757"
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
