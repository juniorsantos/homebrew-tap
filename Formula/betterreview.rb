class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "0.1.4"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"
  depends_on "glab"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.1.4/betterreview-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "be2f95d1e8cd2f3ec8427743c619a3875ca30014a979d39fe3bb8820eba77372"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.1.4/betterreview-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "f1710911e8af4f4ef351c992860f036e30ab67e6236978ddb5c0fc25ba86565d"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v0.1.4/betterreview-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ca01d50abb75ab9bd6bafb8e41fdc06f63d5dcd180ead96176768c5d62e801db"
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
