class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.0/aven-darwin-arm64.tar.gz"
      sha256 "2af624ee120a49f3ff93917aadd851dbbe729acb54d4fcdaac1fd4a74ba87f26"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.0/aven-darwin-amd64.tar.gz"
      sha256 "394b9cff81eba5d3cc40efd0aed0eb13c94c9acf5995c78a7ed61c12027edf04"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.0/aven-linux-arm64.tar.gz"
      sha256 "c451d7f0b3e43ee9d3920209110b094701c9ba67d22d7e0c247bd29b430eb65a"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.0/aven-linux-amd64.tar.gz"
      sha256 "26218e9533bafc1281e7a3f0491149574cc2a978f57c705cfe7e274190bdd95c"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
