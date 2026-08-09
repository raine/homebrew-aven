class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.26/aven-darwin-arm64.tar.gz"
      sha256 "1ce7b7501033ba9f8cea73a222ed1632d34e87b65337ea2b2ded5119c95fbf93"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.26/aven-darwin-amd64.tar.gz"
      sha256 "31e82211c507cb926e9df12e9e4fba800c3162880337f389c71486b76e855434"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.26/aven-linux-arm64.tar.gz"
      sha256 "ea8a7459add65f0eef142b4122198c126f673a4f4c3afce28bebc00d18962cce"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.26/aven-linux-amd64.tar.gz"
      sha256 "de467317de504c7dbe401c2ea80e28de9f0a86f29a540445242d53e42e4e7e39"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
