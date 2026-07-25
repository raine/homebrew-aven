class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.17/aven-darwin-arm64.tar.gz"
      sha256 "f826110e6f29467c3d091dc28aa6661451162460eb9b303d8bdc0e5df0181810"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.17/aven-darwin-amd64.tar.gz"
      sha256 "a177dcb73853095c3122d2dfd3644a2c418943aece55b6db199b48ceda75b2f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.17/aven-linux-arm64.tar.gz"
      sha256 "0e17dde278714af072fb7781ef8d5b2c7ba2542a8730f7db056ffc4599a6981e"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.17/aven-linux-amd64.tar.gz"
      sha256 "25801f9f562d60957f53b382e81281726e01da32ce6dfd86b218a5a12ebc02d5"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
