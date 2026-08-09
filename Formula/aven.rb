class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.27/aven-darwin-arm64.tar.gz"
      sha256 "524777d3cda6905fe06eb3e824228c0fdc959e3a5edc2a2d1763919fdfd5bdf8"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.27/aven-darwin-amd64.tar.gz"
      sha256 "297b088e68e48194d983b9eb758528be9ba3c5daca5b0f769b1dbb9c448ff082"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.27/aven-linux-arm64.tar.gz"
      sha256 "a4b64d407df1a245ce7eda66138d054a555d0e959f03b5780fa47ba734fa35b5"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.27/aven-linux-amd64.tar.gz"
      sha256 "f955be608c0929550d700d678c3ed49049ab425d2c40d541a69c855f57777ec1"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
