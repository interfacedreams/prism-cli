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
  version "1.0.2"
  url "https://github.com/interfacedreams/prism-cli/releases/download/v#{version}/prism-cli-#{version}-macos-universal.tar.gz"
  sha256 "a11b214170b143b54165363a86db7976fe92f858ebe42cba4ea6da5474b8f62c"

  depends_on :macos

  def install
    bin.install "prism"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/prism --help")
  end
end
