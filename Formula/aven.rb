class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.48/aven-darwin-arm64.tar.gz"
      sha256 "06747f1f4b90e0167490064118e3bfd9f16c5264bd165412a627de2ddffb95ed"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.48/aven-darwin-amd64.tar.gz"
      sha256 "2b7c9c06f699caf4a8bfd0fd0aeffb9a0289b7c5acf9203c217be57013a0de86"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.48/aven-linux-arm64.tar.gz"
      sha256 "3d085bdc80910764d03c31db911245c75d321d6a2bda08659057f23021c87e19"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.48/aven-linux-amd64.tar.gz"
      sha256 "c087532b478fbe2d0fbd2699f47d933688fdde1706eb7964c778ae2deef80f97"
    end
  end

  def install
    bin.install "aven"
    generate_completions_from_executable(bin/"aven", "completions")
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
