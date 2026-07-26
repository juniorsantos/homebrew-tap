class Betterreview < Formula
  desc "Terminal code review for GitHub PRs and GitLab MRs"
  homepage "https://github.com/juniorsantos/betterreview"
  version "0.2.0"
  license "MIT"

  depends_on "gh"
  depends_on "git-delta"
  depends_on "glab"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.2.0/betterreview-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "94b64dbfe1e635786548c3890fc92ee608071c5b8b2a38061754dd016f0f22fb"
    else
      url "https://github.com/juniorsantos/betterreview/releases/download/v0.2.0/betterreview-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "6ef8a758f8abe43ab14e59c727a7f5ef6d0f4318274a8f5800725960180dcaa4"
    end
  end

  on_linux do
    url "https://github.com/juniorsantos/betterreview/releases/download/v0.2.0/betterreview-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "49f71eaf4c85cfe5f59189b92592b8924ff58c1307d0493388ef0ce7e3a83c8b"
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
