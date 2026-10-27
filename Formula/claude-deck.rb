class ClaudeDeck < Formula
  desc "Terminal session manager for Claude Code, built on tmux"
  homepage "https://github.com/benteven/claude-deck"
  url "https://github.com/benteven/claude-deck/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "4b86d4055308c4cd0f67138e15a7fe228c832ae668b4293f5217215c9264aa33"
  license "MIT"
  head "https://github.com/benteven/claude-deck.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos
  depends_on "tmux"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    output = shell_output("TMUX=x #{bin}/claude-deck 2>&1", 1)
    assert_match "cannot run inside tmux", output
  end
end
