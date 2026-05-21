# homebrew-cmux

Homebrew tap for [sbourass/cmux](https://github.com/sbourass/cmux), a personal
fork of [manaflow-ai/cmux](https://github.com/manaflow-ai/cmux) carrying the
`feat/per-pane-shell-history` patch.

```bash
brew tap sbourass/cmux
brew install --cask sbourass/cmux/cmux
brew upgrade --cask sbourass/cmux/cmux
```

Builds are ad-hoc signed (not Apple-notarized). See cask caveats for the
one-time Gatekeeper bypass. Conflicts with the upstream cask — install only
one at a time.

The cask is updated automatically by the `update-homebrew-tap.yml` workflow in
`sbourass/cmux` after each tagged release.
