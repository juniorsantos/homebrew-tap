class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "1.3.2"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"
  depends_on "glab"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v1.3.2/betterreview-v1.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "4c5945d83ac0c5e8de522b6190e3f1e8d22b7b00df3f42b44b94f2bbd9c33199"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v1.3.2/betterreview-v1.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "9ec80f53a0e6fbbd72aa0e068cc3a1636c29ce949187c7538b3c05ddf16b21eb"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v1.3.2/betterreview-v1.3.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7e3903d51b610abafcdff9c12bdabe128482ffd42337c4bbd173b98f30ffd214"
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
