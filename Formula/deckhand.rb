class Deckhand < Formula
  desc "Terminal session manager for Claude Code, built on tmux"
  homepage "https://github.com/benteven/deckhand"
  url "https://github.com/benteven/deckhand/archive/refs/tags/v0.15.1.tar.gz"
  sha256 "479d30ae6883eccc33f621c8a5b379ff1a9d7f3f0f0d3a6898a9350c12b8a842"
  license "MIT"
  head "https://github.com/benteven/deckhand.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos
  depends_on "tmux"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
    bin.install_symlink "deckhand" => "claude-deck"
  end

  test do
    output = shell_output("TMUX=x #{bin}/deckhand 2>&1", 1)
    assert_match "cannot run inside tmux", output
  end
end
