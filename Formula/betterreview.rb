class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "0.5.0"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"
  depends_on "glab"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.5.0/betterreview-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "e686ff5a15eb89a7080097ee694a4ec7af907dce7666a3768b4d17cb0700b123"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.5.0/betterreview-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "1a01e7ac918a05573b3fcfbd2abafe2dfaa7bd228b0c56181b161908cac1dd7c"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v0.5.0/betterreview-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "198463e69f4c4834a24a924e95e3a4bd729a568c3500bbf970ff6099965af88f"
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
