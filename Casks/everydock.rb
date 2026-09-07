# frozen_string_literal: true

cask "everydock" do
  version "0.3.2"
  sha256 "91594a4658cab73d20be2c07e732f0b0ec417609f367b99a047e9428d6fc3776"

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

  caveats do
    unsigned_accessibility
    <<~EOS
      This is an ad-hoc signed public beta without Apple notarization.
      If macOS blocks first launch, review the source and approve it in
      System Settings > Privacy & Security > Open Anyway.
      Accessibility permission enables window control; Screen Recording
      permission enables window thumbnails. Downloads may require folder access.
      If permissions are enabled but denied after upgrading, quit the app,
      remove its old entries in Privacy & Security, then add the current app.
      Quit everyDock before upgrading or uninstalling to restore the system Dock.
      Preferences and recovery journals are preserved on uninstall.
    EOS
  end
end
