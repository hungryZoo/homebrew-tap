# frozen_string_literal: true

cask "everydock" do
  version "0.3.8"
  sha256 "c70e4d188857b738350bb8ad41bd21f1480352ce62d95477b426fbac4575f3dd"

  url "https://github.com/hungryZoo/everyDock/releases/download/v#{version}/everyDock-#{version}-arm64.zip"
  name "everyDock"
  desc "Persistent Dock on every display for Apple Silicon Macs"
  homepage "https://github.com/hungryZoo/everyDock"

  livecheck do
    skip "Public beta; releases are reviewed before updating this tap"
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "everyDock.app"

  uninstall quit: "app.everydock.mac"

  # Only opt-in cleanup removes app preferences, including first-run completion.
  # Keep native Dock recovery journals until the app has restored those settings.
  zap trash: [
    "~/Library/Caches/app.everydock.mac",
    "~/Library/Preferences/app.everydock.mac.plist",
    "~/Library/Saved Application State/app.everydock.mac.savedState",
  ]

  caveats do
    unsigned_accessibility
    <<~EOS
      This is an ad-hoc signed public beta without Apple notarization.
      If macOS blocks first launch, review the source and approve it in
      System Settings > Privacy & Security > Open Anyway.
      Accessibility permission enables window control; Screen Recording
      permission enables window thumbnails. Desktop and Downloads may require folder access.
      If permissions are enabled but denied after upgrading, quit the app,
      remove its old entries in Privacy & Security, then add the current app.
      Quit everyDock before upgrading or uninstalling to restore the system Dock.
      Preferences and recovery journals are preserved on uninstall.
      Use brew uninstall --cask --zap everydock to remove preferences and first-run state.
      macOS privacy decisions and native Dock recovery journals are not reset by zap.
      Disable login launch in everyDock settings before a clean uninstall.
    EOS
  end
end
