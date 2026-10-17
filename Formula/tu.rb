# typed: false
# frozen_string_literal: true

# Homebrew formula for `tu` (https://github.com/hungryZoo/tu).
#
#   brew tap hungryZoo/tap
#   brew install hungryZoo/tap/tu
#
# The url/sha256 pairs are rewritten automatically by the `release`
# workflow in hungryZoo/tu on every tagged release. No bottles; each
# url points at a pre-compiled binary attached to the GitHub release.
class Tu < Formula
  desc "Tiny TUI menu on top of tmux"
  homepage "https://github.com/hungryZoo/tu"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.2/tu-1.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "d0c8b06a44b0c77fed463a087f715c8a140e58008b58e7d96e8fd70d8527b3a5"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.2/tu-1.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "875753f74f3051319c0c75e916fc15703ce50895d63e60a7ff50aba6c618ca3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.2/tu-1.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69ab5e6a123186606ed9dee4ec8a61cae80ce56a4e5c16fa6a8d750f0ce72282"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.2/tu-1.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a0b65517a228ebc370dcd2f5f6082165be320eb8153db873689fc9506a2270ac"
    end
  end

  def install
    bin.install "tu"
    doc.install "README.md", "LICENSE"
  end

  test do
    assert_match "tu #{version}", shell_output("#{bin}/tu --version")
  end
end
