class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.28/aven-darwin-arm64.tar.gz"
      sha256 "4919c077b0f9da37ad89db8970bed790ffcbeeb50ff95c4bc0acd3866463b16f"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.28/aven-darwin-amd64.tar.gz"
      sha256 "f35c08bb5603816c511e5092319bec33e78ab2de70ccc3cf680b41f46a0cb63e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.28/aven-linux-arm64.tar.gz"
      sha256 "d02898f4ab51187a568653ba76746ffa81fc3a0642153b29320c4e0a93c1aed2"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.28/aven-linux-amd64.tar.gz"
      sha256 "3fa599b063de4bce37a7cbf17958debccb94ad39a40e4e965cd3fd2933df6d19"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
