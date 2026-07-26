class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "0.3.0"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"
  depends_on "glab"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.3.0/betterreview-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "9634ec5e91e755bf253277bf61246ef0504345d8bc5d108bff1928ee3782d064"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.3.0/betterreview-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "a3f985d63dbf7e50d98769fe66ce9f8348eb5206721d95f48df85e2bc869ce0a"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v0.3.0/betterreview-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "867d3dddd9717c9cd62201d4c530d3f50777828a6be39103486352aa31e152fc"
  end

  def install
    bin.install "betterreview"
  end

  def caveats
    <<~EOS
      Authenticate before the first review:
        gh auth login    # GitHub
        glab auth login  # GitLab
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/betterreview --version")
  end
end
