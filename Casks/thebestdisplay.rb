cask "thebestdisplay" do
  version "1.0.1"
  sha256 "1c8684f255ddef54bddccb7a510886e46c13eb595e0db0dc6e49282cf81bedac"

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
