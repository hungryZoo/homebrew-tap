cask "thebestdisplay" do
  version "1.0.0"
  sha256 "93b98e067cdf7ad719985940ed9eaf555b77ffd606e82a62c136eed6d18cb1e6"

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
