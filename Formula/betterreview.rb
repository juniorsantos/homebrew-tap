class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "1.0.0"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"
  depends_on "glab"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v1.0.0/betterreview-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "cf4be622b06cba92e33474c742a0c3fb9a884735156b9d5a564dceb26db8bd7f"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v1.0.0/betterreview-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "d0aca9c793eb3ae79e7cfed0c97fd50cfb7455634ab90b749dc060ecaf5afe23"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v1.0.0/betterreview-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a78518a7c261efaafbdc2284d0480bd08c763c6fe306732bdfdc04f35bfe6048"
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
