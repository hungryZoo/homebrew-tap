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
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.6/tu-1.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "9200c3345ac37188b28906237b13ff416f7e09345a2c336aa1af76ef9a208272"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.6/tu-1.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "84171e6d957bfae36fa165ebf5c7a794a085570120d337199732a744de1ac170"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.6/tu-1.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ddb6100ae70f3a76d349a95fe1dc600adb493e8f95431c15ae04e6d669e4b0c"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.6/tu-1.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c1ad5f34218c8c42eb4b4425ddfe9376311d259d4640885ab8ec973cc6e6224"
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
