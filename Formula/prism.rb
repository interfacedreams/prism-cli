# Homebrew formula for the Prism CLI (prebuilt, notarized binary).
#
# This lives in the prism-cli repo itself — no separate homebrew-tap repo. Users tap it
# by explicit URL, which lets any repo name serve as a tap:
#   brew tap interfacedreams/tap https://github.com/interfacedreams/prism-cli
#   brew install interfacedreams/tap/prism
#
# Per release, release-cli.sh prints the new url + sha256 to paste below.
class Prism < Formula
  desc "Command-line access to your Prism notes — create, read, and automate from the terminal"
  homepage "https://github.com/interfacedreams/prism-cli"
  version "1.0.1"
  url "https://github.com/interfacedreams/prism-cli/releases/download/v#{version}/prism-cli-#{version}-macos-universal.tar.gz"
  sha256 "affc4125d8b2c1252883fcaefcfb05da439cab9900e8f06053606ea8dc7204e2"

  depends_on :macos

  def install
    bin.install "prism"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/prism --help")
  end
end
