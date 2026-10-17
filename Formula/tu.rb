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
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.4/tu-1.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "2fb56a9a5a164c695dfee3648348b5e3b08e56470f31417ca6628fc954d37f07"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.4/tu-1.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "6b1271e0000081137e19c0ae923f3a1cf445968e793dc1531963dcfff50efcf3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.4/tu-1.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2736816f3ffba744dbb55c60488b0a538444f901e7cad1cd8061c945c3cd85e4"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.4/tu-1.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d140b9cf89906a6fb674a1229a0e3677e3fc90ee1fe6fc293688008de3e31e7c"
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
