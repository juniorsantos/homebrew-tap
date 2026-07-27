class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "1.1.0"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"
  depends_on "glab"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v1.1.0/betterreview-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "bc7829e302bb1c801f3d980490809e89302811b522386f47d35dd74f0032afcf"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v1.1.0/betterreview-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "03503f6214a653824ecba72930c027af0941614627e00cb1c25334e7a4d38795"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v1.1.0/betterreview-v1.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bc8bc3f68cab1f57e15a7f3e85d0a1e06cd31e2d1c684c8f187de3827990b3d1"
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
