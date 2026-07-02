class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.0/aven-darwin-arm64.tar.gz"
      sha256 "0c975b83d7c8ca037284f5f5396d4c50318b87f4212a4fee8b9560a6fd6b220f"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.0/aven-darwin-amd64.tar.gz"
      sha256 "0dbf8e0fd46526331b263903a9fceb83ddf8c1729b07f72d431520d2aa03cd7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.0/aven-linux-arm64.tar.gz"
      sha256 "f5c4f95e39bfeed78607874628daf0e707285561e5adccdb5a2abf7716af874d"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.0/aven-linux-amd64.tar.gz"
      sha256 "44f1e2d1b1db75f5c4f4fb1270a2d9239483fdf62b4b1f647b5834fffeda5456"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
