class ClaudeDeck < Formula
  desc "Terminal session manager for Claude Code, built on tmux"
  homepage "https://github.com/benteven/claude-deck"
  url "https://github.com/benteven/claude-deck/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "75f3110a1409b9b6b2d2e36a43d3e73bea4ef7fbe90d69e0cd4d9586d660d98f"
  license "MIT"
  head "https://github.com/benteven/claude-deck.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos
  depends_on "tmux"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("TMUX=x #{bin}/claude-deck 2>&1", 1)
    assert_match "cannot run inside tmux", output
  end
end
