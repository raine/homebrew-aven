class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.19/aven-darwin-arm64.tar.gz"
      sha256 "37fed6f5857fa75c642ef28b80509a15475dfa1af1f9d0304ea334abd5b414db"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.19/aven-darwin-amd64.tar.gz"
      sha256 "f81e5a08fcda05f8b687f0dd2050e6e3b81e3e9553a734fa37389560436fca05"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.19/aven-linux-arm64.tar.gz"
      sha256 "7160ccccd30db8c7f39f0a7e943372e16f901481890508691a0ba91b581c3d2f"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.19/aven-linux-amd64.tar.gz"
      sha256 "cddc8b4c7b04e2b9d056c14447b99e7b1a332c17c35e5e07355d2355a6104ba0"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
