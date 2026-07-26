class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "0.4.0"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"
  depends_on "glab"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.4.0/betterreview-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "0544710ff091fe833c2eddec764331ec30947ecf97d7fc669bdad771606f7302"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.4.0/betterreview-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "a0c6a1da39a8adafa17d1a8398c0b10ab7650d970289eca8ddf75bbb59d81ed2"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v0.4.0/betterreview-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "aa72b7ed991f1efab74859f1f2128f7390bfa03e8e4b4f92b2ee2f470be353e1"
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
