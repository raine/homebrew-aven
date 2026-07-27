class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.18/aven-darwin-arm64.tar.gz"
      sha256 "fe10f9475a1127224794c0ed4d0cb3e4895cee3e66290a70996238536e2215e1"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.18/aven-darwin-amd64.tar.gz"
      sha256 "782683ab9c2ce084085dc0421f847281997506bde72e75bf906d21c43c25d6db"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.18/aven-linux-arm64.tar.gz"
      sha256 "36eb2a63512710d4189987a948cbd0e8a957f21d0f62ac315428ba8b2034bc36"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.18/aven-linux-amd64.tar.gz"
      sha256 "6226bd09827f4d841a48aa7e504dbcdd81f9cfd4fe5516d5af21a5d9d2fd690b"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
