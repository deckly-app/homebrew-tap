# Written by `cargo dev release-files`; edit packaging/homebrew/deckly.rb.in
# in the Deckly repository instead.
class Deckly < Formula
  desc "Unofficial, independent app for Stream Deck hardware"
  homepage "https://github.com/deckly-app/Deckly"
  version "0.0.6"
  license "MIT"

  on_arm do
    url "https://github.com/deckly-app/Deckly/releases/download/v0.0.6/deckly-aarch64-apple-darwin.tar.gz"
    sha256 "d30a387cf87979b342b81d5eff57936f73ab8f55ea48a5bd6ed16fbe69c023eb"
  end
  on_intel do
    url "https://github.com/deckly-app/Deckly/releases/download/v0.0.6/deckly-x86_64-apple-darwin.tar.gz"
    sha256 "f91d0e5f7de59b691fc16dd965dfcf2bcd2a844cbd11bc4ae7716ec563fb2e12"
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
