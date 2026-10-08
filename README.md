# homebrew-tap

Homebrew tap for [navette](https://github.com/slabbdev/navette) — the browser for agents.

```sh
brew install slabbdev/tap/navette
navette serve --port 8765
```

macOS arm64 (Apple Silicon) build. Windows and Linux: grab the release binary from the
[navette releases](https://github.com/slabbdev/navette/releases) or run `cargo install navette-browser`.

The formula is bumped automatically: an hourly workflow
([bump.yml](.github/workflows/bump.yml)) tracks the latest navette release and updates
`Formula/navette.rb` with the new version and sha256 — run it by hand with
`gh workflow run bump -R slabbdev/tap`.

> Formerly `slabbdev/navette` — the repo was renamed, old taps keep working through
> GitHub's redirect.
