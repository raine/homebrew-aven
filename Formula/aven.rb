class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.8/aven-darwin-arm64.tar.gz"
      sha256 "736742bdc09e6fa3be8da4ea9c5cfd74922cae3a2f4eef33b642d67b2e8a415b"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.8/aven-darwin-amd64.tar.gz"
      sha256 "0309ccd7777f1912dbb2b1ce69336fc6b27caff3aa07fd383fbb300807be98db"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.8/aven-linux-arm64.tar.gz"
      sha256 "39817b384dea106eee71003a48764163f167ad72c246d38139f3b03d9eef1485"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.8/aven-linux-amd64.tar.gz"
      sha256 "8682dc8e46d2ce3b76f58b7440fd15e3241b8edcf011b8eae91b8d824f5362ec"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
