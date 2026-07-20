cask "cmux" do
  version "0.64.20-sb.1"
  sha256 "c327daceae493bda8437f631b69f306744251578fb9ca67dc7e11452d555b78a"

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

    Uninstalling keeps your cmux preferences and session state (shared with
    the upstream cmux app). `brew uninstall --zap` additionally clears this
    fork's per-pane shell history and regenerated caches. To remove
    everything cmux stores -- including preferences, which may contain
    sensitive data -- also run:

      rm -rf "$HOME/Library/Application Support/cmux" "$HOME/Library/Caches/cmux" "$HOME/Library/Preferences/com.cmuxterm.app.plist"
  EOS

  zap trash: [
    # Both entries are intentional. The SHARED live state -- the main
    # "~/Library/Application Support/cmux" dir and the "com.cmuxterm.app"
    # prefs (same bundle id as upstream) -- is deliberately NOT listed, so a
    # revert to upstream keeps session state and settings. panel-history is
    # fork-specific (would otherwise orphan under upstream); Caches regenerate.
    "~/Library/Application Support/cmux/panel-history",
    "~/Library/Caches/cmux",
  ]
end
