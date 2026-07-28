class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "1.2.0"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"
  depends_on "glab"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v1.2.0/betterreview-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "ac9b73ec77e592e08b4769b85a3af6769555c10e54196a928217eb0e8c9bc4ea"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v1.2.0/betterreview-v1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "42de3e5a8172db0f120d07c2f7998d04fae4fa5934b7e7cb1240bec011b5224f"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v1.2.0/betterreview-v1.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2507415f48b36cba0b520e56cb329033bf90056e1b0b471d7e68fee6e95a8741"
  end

  def install
    bin.install "betterreview"
    generate_completions_from_executable(bin/"betterreview", "completions", shells: [:bash, :zsh, :fish])
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
