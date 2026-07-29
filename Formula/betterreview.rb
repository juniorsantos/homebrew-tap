class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "1.3.0"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"
  depends_on "glab"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v1.3.0/betterreview-v1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "52da843b43e9b844ae88cc092406199f3edb23f8165e5d8371f3a3c4e8d96cad"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v1.3.0/betterreview-v1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "a27b6214c50ec41d0ed81517c4d1b62890bb37423b966f6f22a4ebcb9518c56e"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v1.3.0/betterreview-v1.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9e307afb99cfbe61f835b39cdf33021548544d7b78b0b0747c1b69ed9443a5bd"
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
