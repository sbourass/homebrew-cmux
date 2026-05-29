cask "cmux" do
  version "0.64.10-sb.2"
  sha256 "f028869d50d901e7d18569f0605877386380cac299e2ac5218cfc3400f14fe04"

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
