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
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.8/tu-1.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "9f4f01152c720225305cf123201828778ceb868514ba4afa09e8afa2f6c79290"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.8/tu-1.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "1bd0dbd66167e0f54c2b70cc372beb848ba6def4d191dba454c3ece0a9a99518"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.8/tu-1.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8aacd84a2afb1afd12ff277afd9b42db50e39a2cea90b3195bb88fe4aa676c1f"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.8/tu-1.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f2a3e0999d14ae4021304c683381d9c396eccac8ea80480fb25d3e855405c27"
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
