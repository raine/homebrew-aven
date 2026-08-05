class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.24/aven-darwin-arm64.tar.gz"
      sha256 "a44f36b5836efdcdca186ef578179b3809833c3f5208eecf03493e95d7991057"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.24/aven-darwin-amd64.tar.gz"
      sha256 "cb4d87e2648dc6c093a0bc01df6706ad1aa03c21d187e3a53c0bd3c879162e81"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.24/aven-linux-arm64.tar.gz"
      sha256 "2ada4adadfe28fd5c4d692e736dbcb1c78ddacc98917832f9a5bc30519cb8950"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.24/aven-linux-amd64.tar.gz"
      sha256 "d557edb31073ce400d1d6f311a8cbbdce61dda1ccb4770d02d1369ed6bab1b10"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
