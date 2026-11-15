# Written by `cargo dev release-files`; edit packaging/homebrew/deckly.rb.in
# in the Deckly repository instead.
class Deckly < Formula
  desc "Unofficial, independent app for Stream Deck hardware"
  homepage "https://github.com/deckly-app/Deckly"
  version "0.0.5"
  license "MIT"

  on_arm do
    url "https://github.com/deckly-app/Deckly/releases/download/v0.0.5/deckly-aarch64-apple-darwin.tar.gz"
    sha256 "55aa8ed087877ae30f95b4c6b2827783bfaf6cb2a9200aae32db8334354c9286"
  end
  on_intel do
    url "https://github.com/deckly-app/Deckly/releases/download/v0.0.5/deckly-x86_64-apple-darwin.tar.gz"
    sha256 "d92b02dac6cc7d0ad5a7fc3a835d3dcf43b53d96fe1f2fda04556a999b11ca83"
  end

  depends_on :macos

  def install
    prefix.install "Deckly.app", "LICENSE", "THIRD-PARTY-LICENSES.txt"
    bin.write_exec_script prefix/"Deckly.app/Contents/MacOS/deckly"
  end

  def caveats
    <<~EOS
      Start Deckly with `deckly`, or add it to Launchpad and Spotlight:
        ln -sf #{opt_prefix}/Deckly.app ~/Applications/Deckly.app
    EOS
  end

  test do
    assert_predicate prefix/"Deckly.app/Contents/MacOS/deckly-web", :exist?
  end
end
