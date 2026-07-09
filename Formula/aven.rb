class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.4/aven-darwin-arm64.tar.gz"
      sha256 "6aee48b194125d7097239887c50835fa128fa727805c098e7923d4def0690e25"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.4/aven-darwin-amd64.tar.gz"
      sha256 "30aa3ebdd1de1a9124604f6231f0e29fae54320e7a6255793ce43b75172e5ee3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.4/aven-linux-arm64.tar.gz"
      sha256 "21554cc3d9915a71043a49c543d164213a78c14f655d3f226042ed61a56327f8"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.4/aven-linux-amd64.tar.gz"
      sha256 "6cef9f1f36312262fbf949dfd859a115cb1edc5d2d1ff7e29bbfbf606d577bc6"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
