cask "quickjaso" do
  version "1.0.0"
  sha256 "c0491c7a7c929e79d7eb3f02de7c1fef15d10ff82c95c74065bba4507904281f"

  url "https://github.com/hungryZoo/quickJaso/releases/download/v#{version}/quickJaso-#{version}.dmg"
  name "quickJaso"
  desc "Finder service to check and convert file names to Unicode NFC for Windows"
  homepage "https://github.com/hungryZoo/quickJaso"

  depends_on macos: :ventura

  app "quickJaso.app"

  zap trash: "~/Library/Preferences/com.heonzoo.quickJaso.plist"

  caveats <<~EOS
    quickJaso is ad-hoc signed and not notarized, so macOS Gatekeeper will
    block the first launch. After installing, either run:
      xattr -dr com.apple.quarantine "#{appdir}/quickJaso.app"
    or open System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
