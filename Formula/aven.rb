class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.12/aven-darwin-arm64.tar.gz"
      sha256 "c2d042c87d8625478bb1a4d5b0ac1be9adf3fa81a55969b1c42a801afe96c3b4"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.12/aven-darwin-amd64.tar.gz"
      sha256 "96b74aeaf475874cb72c43aa068cb4a223ce674ced54a55b004c6197edaa3afc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.12/aven-linux-arm64.tar.gz"
      sha256 "db5d9f7eaaaa848fb306f0e72885d8aa46d5c8819b162ab115c823881dae8b25"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.12/aven-linux-amd64.tar.gz"
      sha256 "6d208ffe6ef6c84042a9c3552a36501982bacb5dc3bb7576c211f88acd79b775"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
