class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.54"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.54/aven-darwin-arm64-app.tar.gz"
      sha256 "6102f49bd9e20db8799749a5b3abe7acaab454a2ef15944ee18d879581453211"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.54/aven-darwin-amd64-app.tar.gz"
      sha256 "f5b1a4b4fda3943bea5e99f5ea87e6a2aba57bd111187a50090450c7fb73434e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.54/aven-linux-arm64.tar.gz"
      sha256 "95935c14c49afa0f2468f1b9ffa42958933b40a2381d196740f67f022abc2cf3"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.54/aven-linux-amd64.tar.gz"
      sha256 "83f66f7513f428cf362999b9695f659db5904bd4c12830fa879e43d487049c76"
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
