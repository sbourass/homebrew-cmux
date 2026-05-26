cask "cmux" do
  version "0.64.10-sb.1"
  sha256 "1a76c30907a021b7247d265593eafa97859bd10ec86994d1d323661709d18d3e"

  url "https://github.com/sbourass/cmux/releases/download/v#{version}/cmux-macos.dmg"
  name "cmux (sbourass fork)"
  desc "Fork of manaflow-ai/cmux with per-pane shell history isolation"
  homepage "https://github.com/sbourass/cmux"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "cmux.app"
  binary "#{appdir}/cmux.app/Contents/Resources/bin/cmux"

  caveats <<~EOS
    This is an ad-hoc-signed build, not Apple-notarized. On first launch macOS
    will refuse to open it. Either right-click cmux.app -> Open and confirm, or
    clear the quarantine bit:

      xattr -dr com.apple.quarantine /Applications/cmux.app

    Conflicts with the upstream `manaflow-ai/cmux` cask (same cask token);
    install only one at a time.
  EOS

  zap trash: [
    "~/Library/Application Support/cmux",
    "~/Library/Caches/cmux",
    "~/Library/Preferences/ai.manaflow.cmuxterm.plist",
  ]
end
