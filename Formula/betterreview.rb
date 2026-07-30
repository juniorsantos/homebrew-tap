class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "1.3.1"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"
  depends_on "glab"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v1.3.1/betterreview-v1.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "b46c43c16874a9bd645a287f8b561a9ca99e64987b53a80af03c93da5a4f21d6"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v1.3.1/betterreview-v1.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "b408db5f67e20467fdafadb56b2a84def6115748bce9379f83ea5c07d18a3923"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v1.3.1/betterreview-v1.3.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e3307cfba07ed7dfbfe0797e39ecd0eb40b002e2bf9aa63dc129738a619d8bbe"
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
