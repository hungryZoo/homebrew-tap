cask "quickjaso" do
  version "1.0.0"
  sha256 "4fe4a26b70f5d50d278fde6b56188f7c7319db3afcae0d0972af3f0dd2a7ee96"

  url "https://github.com/hungryZoo/quickJaso/releases/download/v#{version}/quickJaso-#{version}.dmg"
  name "quickJaso"
  desc "Finder service that inspects and converts file names to Unicode NFC for Windows compatibility"
  homepage "https://github.com/hungryZoo/quickJaso"

  depends_on macos: :ventura

  app "quickJaso.app"

  caveats <<~EOS
    quickJaso is ad-hoc signed (not notarized). If macOS blocks the first launch,
    open System Settings > Privacy & Security and click "Open Anyway",
    or install with: brew install --cask --no-quarantine hungryZoo/tap/quickjaso
  EOS

  zap trash: [
    "~/Library/Preferences/com.heonzoo.quickJaso.plist",
  ]
end
