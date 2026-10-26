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
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.7/tu-1.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "6e9ec99910dd7b18f6dd8014f8a9dd1591ade089cad7a168030ec742a4830753"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.7/tu-1.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "90a5b09fe9a2794f01eba8e858ec5eb7c460bd3f85e14bd358ef3a6f71400c2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.7/tu-1.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "31ab427c6a32ef779a4549971d396f415913d9fd029b31691455fccf67d2925f"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.7/tu-1.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b21e0f2e851ab443a97e8f032a5f5f7ee61492bca79d22afadabe87c58860cc1"
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
