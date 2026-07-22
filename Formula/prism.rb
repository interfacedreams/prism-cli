# Homebrew formula for the Prism CLI (prebuilt, notarized binary).
#
# For `brew install interfacedreams/tap/prism` to work, this file must live in a
# repo named `homebrew-tap` under your account. Either:
#   - create github.com/interfacedreams/homebrew-tap and put this file there, or
#   - keep it here and users install with the repo name:
#       brew install interfacedreams/prism-cli/prism   (repo would need to be homebrew-prism-cli)
#
# Per release, the release-cli.sh script prints the new url + sha256 to paste below.
class Prism < Formula
  desc "Command-line access to your Prism notes — create, read, and automate from the terminal"
  homepage "https://github.com/interfacedreams/prism-cli"
  version "0.0.0"
  url "https://github.com/interfacedreams/prism-cli/releases/download/v#{version}/prism-cli-#{version}-macos-universal.tar.gz"
  sha256 "REPLACE_WITH_RELEASE_TARBALL_SHA256"

  depends_on :macos

  def install
    bin.install "prism"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/prism --help")
  end
end
