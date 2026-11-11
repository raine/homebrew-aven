cask "aven" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.56"
  sha256 arm:   "4f1298af661de0166e5142852abffeb0d77e3751f22db121db95de1103b4a280",
         intel: "97ff350083983719c7ca3f7e1a9f47de0311e6bde5c22b7000b442dd48927936"

  url "https://github.com/raine/aven/releases/download/v#{version}/Aven-#{arch}.dmg"
  name "Aven"
  desc "Local-first task manager"
  homepage "https://github.com/raine/aven"

  auto_updates true
  depends_on macos: :ventura

  app "Aven.app"
  binary "#{appdir}/Aven.app/Contents/MacOS/aven"

  zap script: {
        executable: "/bin/sh",
        args:       ["-c", <<~SH],
          for label in fi.zendit.Aven.daemon com.raine.aven.daemon; do
            plist="$HOME/Library/LaunchAgents/$label.plist"
            [ -f "$plist" ] || continue
            program=$(/usr/bin/plutil -extract ProgramArguments.0 raw -o - "$plist" 2>/dev/null) || continue
            case $program in
              "#{appdir}/Aven.app/"*) ;;
              *) continue ;;
            esac
            /bin/launchctl bootout "gui/$(/usr/bin/id -u)/$label" 2>/dev/null
            /bin/rm -f "$plist"
          done
        SH
      },
      trash:  [
        "~/.cache/aven",
        "~/Library/Caches/fi.zendit.Aven",
        "~/Library/Preferences/fi.zendit.Aven.plist",
        "~/Library/Saved Application State/fi.zendit.Aven.savedState",
      ]

  caveats <<~EOS
    Aven can keep sending reminders and syncing after you quit it, through a
    background agent. Uninstalling leaves that agent in place, stopped while
    Aven.app is gone, so reinstalling picks up where you left off. To remove
    the agent too, run:
      brew uninstall --zap aven
    Your tasks, configuration and sync credentials stay either way.
  EOS
end
