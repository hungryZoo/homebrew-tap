cask "quickjaso" do
  version "1.0.1"
  sha256 "bffb55866cb9078c69c1061dd39596f0c6183e0eb4b71f29617f0ed1760d8497"

  url "https://github.com/hungryZoo/quickJaso/releases/download/v#{version}/quickJaso-#{version}.dmg"
  name "quickJaso"
  desc "Finder service to check and convert file names to Unicode NFC for Windows"
  homepage "https://github.com/hungryZoo/quickJaso"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "quickJaso.app"

  zap trash: [
    "~/Library/Caches/quickJaso",
    "~/Library/Preferences/com.heonzoo.quickJaso.plist",
  ]

  caveats <<~EOS
    quickJaso is ad-hoc signed and not notarized, so macOS Gatekeeper will
    block the first launch. After installing, either run:
      xattr -dr com.apple.quarantine "#{appdir}/quickJaso.app"
    or open System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
