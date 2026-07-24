class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "0.1.0"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.1.0/betterreview-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "38d5fbb6caa44df1810bac5a4b9130a2cc920e8d9b319ce338492ca953c946fe"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.1.0/betterreview-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "b5369c598d3451d7915da9e5bec109389d343ae535dd059bf7ab5e8b2a28d898"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v0.1.0/betterreview-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "15501e3edc415b92c1c54d5865fa24c559aa37c275ce9202345146e58e96bcef"
  end

  def install
    bin.install "betterreview"
  end

  def caveats
    <<~EOS
      Authenticate with GitHub before the first review:
        gh auth login
      For GitLab merge requests, also install glab:
        brew install glab && glab auth login
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/betterreview --version")
  end
end
