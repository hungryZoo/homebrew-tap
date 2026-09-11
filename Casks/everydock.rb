# frozen_string_literal: true

cask "everydock" do
  version "0.3.9"
  sha256 "5ce2270b47bca7ff203e22aed2f5cf51fa94514eb67556f5f7da913426d94317"

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

  # Runtime command inspection must distinguish removal from upgrade; serialized steps cannot do this.
  # rubocop:disable Cask/InstallSteps
  uninstall_preflight do
    # Homebrew also runs flight blocks during upgrade. Only explicit removal or
    # reinstall resets settings; unknown commands preserve them.
    next unless %w[uninstall reinstall].include?(Homebrew.running_command_with_args.split[1])

    cleanup = "#{appdir}/everyDock.app/Contents/MacOS/everyDock"
    if File.exist?(cleanup)
      system_command cleanup, args: ["--reset-for-uninstall"], sudo: false
    else
      running = system_command "/usr/bin/pgrep", args: ["-x", "everyDock"], must_succeed: false
      raise "Quit everyDock before resetting its settings." if running.exit_status.zero?

      system_command "/usr/bin/defaults", args: ["delete", "app.everydock.mac"], must_succeed: false
      FileUtils.rm_rf [
        "#{Dir.home}/Library/Caches/app.everydock.mac",
        "#{Dir.home}/Library/Saved Application State/app.everydock.mac.savedState",
      ]
    end
  end

  uninstall quit: "app.everydock.mac"

  # rubocop:enable Cask/InstallSteps

  # Also support cleanup of leftovers after the app bundle is already absent.
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
      Uninstall and reinstall reset app settings, first-run state and login registration.
      Upgrade preserves settings. Cleanup must finish before the app is removed.
      macOS privacy decisions are managed by macOS and are not deleted.
      Missing permissions show the setup guide on every launch.
    EOS
  end
end
