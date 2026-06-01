cask "cmux" do
  version "0.64.11-sb.1"
  sha256 "b955fcfb1219e4726a563d3b112aae385695c29f3a9c471bf61840d9ddd5bd13"

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
