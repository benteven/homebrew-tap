class Deckhand < Formula
  desc "Terminal session manager for Claude Code, built on tmux"
  homepage "https://github.com/benteven/deckhand"
  url "https://github.com/benteven/deckhand/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "ba63cdf342f8693a29ac9db005d15a5a12afc19f1f6d00e59eff7dbcd81592dd"
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
