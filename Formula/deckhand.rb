class Deckhand < Formula
  desc "Terminal session manager for Claude Code, built on tmux"
  homepage "https://github.com/benteven/deckhand"
  url "https://github.com/benteven/deckhand/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "1e58383a682f0f542c83c6d097ed6282ac6b3bc648a391f731b464f04cb252f3"
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
