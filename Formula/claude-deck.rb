class ClaudeDeck < Formula
  desc "Terminal session manager for Claude Code, built on tmux"
  homepage "https://github.com/benteven/claude-deck"
  url "https://github.com/benteven/claude-deck/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "df6650e45b7bbe6c92876a4e85b6fbb2db6986d6e8326aff1d46a4d221ed7883"
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
