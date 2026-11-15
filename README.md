# Homebrew tap for Deckly

[Deckly](https://github.com/deckly-app/Deckly) is an unofficial, independent app
for Stream Deck hardware. It is not made, approved or supported by Elgato or
Corsair.

```sh
brew install deckly-app/tap/deckly
```

Then start it with `deckly`, or link the app into `~/Applications` as the
install message shows. macOS support is experimental: see Deckly's
`docs/devices.md` for what has been tested.

This tap moved from `auuruum/homebrew-tap`. A Mac that tapped the old name
keeps getting updates through GitHub's redirect; to switch to the new name:

```sh
brew untap auuruum/tap
brew tap deckly-app/tap
```

`Formula/deckly.rb` is generated for each release by Deckly's release
workflow (`deckly.rb` in the release assets); do not edit it by hand.
