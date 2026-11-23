cask "thebestdisplay" do
  version "1.0.3"
  sha256 "8a581119a03df6377e49a66bd12a43b66c1e4310f3a895f8335b920285662bab"

  url "https://github.com/hungryZoo/TheBestDisplay/releases/download/v#{version}/TheBestDisplay-#{version}.dmg"
  name "TheBestDisplay"
  desc "Display settings and connection diagnostics in one window"
  homepage "https://github.com/hungryZoo/TheBestDisplay"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "TheBestDisplay.app"
  binary "#{appdir}/TheBestDisplay.app/Contents/MacOS/tbdctl"

  zap trash: [
    "~/Library/Application Support/TheBestDisplay",
    "~/Library/Caches/TheBestDisplay",
    "~/Library/Preferences/dev.thebestdisplay.app.plist",
  ]

  caveats <<~EOS
    TheBestDisplay is ad-hoc signed and not notarized, so macOS Gatekeeper will
    block the first launch. After installing, either run:
      xattr -dr com.apple.quarantine "#{appdir}/TheBestDisplay.app"
    or open System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
