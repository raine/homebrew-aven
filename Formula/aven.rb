class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.10/aven-darwin-arm64.tar.gz"
      sha256 "add707db1a1e0877204fc79524dee840a21c446c75e6daacfb7993095d2bddad"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.10/aven-darwin-amd64.tar.gz"
      sha256 "b04f86db6913236ecf4978ca737722a6d044e1348167bbf08d96df53ef86560c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.10/aven-linux-arm64.tar.gz"
      sha256 "a634b04a25723567a020b4b0a37b3f4742f091178d92021c6eb2cbb1809f4416"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.10/aven-linux-amd64.tar.gz"
      sha256 "ec208d4a4dbee7109c693c5e039612d40c867e3bea21809ec05dd6995a2b6c2b"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
