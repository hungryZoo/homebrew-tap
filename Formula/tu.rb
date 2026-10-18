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
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.5/tu-1.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "2b4a65ee43ef94f793eea8dd66b9b6df7411d1b37ec178bc8792b61fccfb5a04"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.5/tu-1.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "79934d6ec7ff0d29c2495350c2dda45c31219e6358ba2a442294ec072e82b550"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.5/tu-1.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60238295a68b5e247bb00b6a617529d440bccf576cc6276540227f1449cbc613"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.5/tu-1.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "590241dd75fbffc01962c644c28546a3b0db1a944dda4d8eb978629b9e78a9c3"
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
