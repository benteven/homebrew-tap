class Deckhand < Formula
  desc "Terminal session manager for Claude Code, built on tmux"
  homepage "https://github.com/benteven/deckhand"
  url "https://github.com/benteven/deckhand/archive/refs/tags/v0.11.2.tar.gz"
  sha256 "41aeeccdb40804c77e1cf9010ef8e23fb252229942fe2be5e1132652ce5bd7ab"
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
