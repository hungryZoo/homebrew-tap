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
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.3/tu-1.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "0b47a484dbfba4cd696d538b80782c2bf80b7346db41c37dd61c7b36451efcc6"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.3/tu-1.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "4752960043019adfde461825a2135b806ddc365a478f4f70125f364ec7459b8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.3/tu-1.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "792cc5c3b01bfb582a28e189cead2c43de3fb3de3be3cd988525a06703195122"
    end
    on_intel do
      url "https://github.com/hungryZoo/tu/releases/download/v1.1.3/tu-1.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d0539fa0947b1ed4ac57187a383bf083e93af74ef909da8b11b9bc7e0ef0fb92"
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
