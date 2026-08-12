class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.29/aven-darwin-arm64.tar.gz"
      sha256 "4f712a2385d3f5a632883fadbc86888f8352716ddcb690d4ea0f18009916d650"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.29/aven-darwin-amd64.tar.gz"
      sha256 "8c7f3dafc877f6653e44eb00f51aebc7f4dba99c29c1f1f020d2c0a1a05049a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.29/aven-linux-arm64.tar.gz"
      sha256 "7f308b1346ddb8d3add4d712eb422f0a347650af69e380be342421088498077b"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.29/aven-linux-amd64.tar.gz"
      sha256 "8f240cc324d2c3ba58c1e33693d9ce5023f6e5ed8f842b20579f88e7e2b59b21"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
