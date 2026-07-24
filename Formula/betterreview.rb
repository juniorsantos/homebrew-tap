class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "0.1.1"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"
  depends_on "glab"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.1.1/betterreview-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "e1d66cad40face535fa4174f1c876ad3d2db339116bcc9e41413747b5561be5d"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.1.1/betterreview-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "ed1a7ba693a01c16e2531f2c2e4b108ad19336b0d8a836f7f4e260f055afc71e"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v0.1.1/betterreview-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e0d3616be43243648029f0f98f9e3e0f7799f9531d72c8fa19a125f3be065fa3"
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
