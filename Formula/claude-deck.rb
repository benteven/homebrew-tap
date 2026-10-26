class ClaudeDeck < Formula
  desc "Terminal session manager for Claude Code, built on tmux"
  homepage "https://github.com/benteven/claude-deck"
  url "https://github.com/benteven/claude-deck/archive/refs/tags/v0.5.4.tar.gz"
  sha256 "b6cdd6028b504acfb0b9a3648ef1715d232d3a6d99478da76d02bc456c7effda"
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
