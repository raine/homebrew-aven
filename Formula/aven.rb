class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.40/aven-darwin-arm64.tar.gz"
      sha256 "8896d439e6c55f15320f45651be954973b8315c8a65b4780894815cc0621a02d"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.40/aven-darwin-amd64.tar.gz"
      sha256 "d2912e2e2084d9dc9f18b6bf022fd0f6042846390d32396588e98dc3dad5b040"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.40/aven-linux-arm64.tar.gz"
      sha256 "2e1d754bb4155c7ca55f9be399045a174e556e8a0e81ae2e68bb1a0bedfbeb5e"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.40/aven-linux-amd64.tar.gz"
      sha256 "0f3162cdc921e85f90e090b3d4786ebfd3f273ac4a82caa09bda17bdfb3c0b22"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
