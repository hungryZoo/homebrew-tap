class Sshtui < Formula
  desc "Terminal interface for the system SSH client"
  homepage "https://github.com/hungryZoo/sshtui"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hungryZoo/sshtui/releases/download/v0.1.0/sshtui-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "f4e0eb8fc530ba786c3645210bdebd00c3b1e1196e17008a1860796f8c54111d"
    end
    on_intel do
      url "https://github.com/hungryZoo/sshtui/releases/download/v0.1.0/sshtui-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "49c6bccd098180213be7588c00e64eb96c7e39f57c56d574f0bd861f2ef2e540"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hungryZoo/sshtui/releases/download/v0.1.0/sshtui-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6dffd8a8fe3a0928d11c205de537ec41d4fab4c3648a94b18c8a714e0db0e329"
    end
    on_intel do
      url "https://github.com/hungryZoo/sshtui/releases/download/v0.1.0/sshtui-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c7858fe3db8d5f50428f47383df730775f1d877f0a1c80c0eb60054a5ead9494"
    end
  end

  def install
    bin.install "sshtui"
  end

  test do
    assert_equal "sshtui #{version}", shell_output("#{bin}/sshtui --version").strip
  end
end
