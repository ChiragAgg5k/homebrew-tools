class Mailslot < Formula
  desc "Apple Mail from the terminal, for accounts other tools cannot sign in to"
  homepage "https://github.com/ChiragAgg5k/mailslot"
  url "https://github.com/ChiragAgg5k/mailslot/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "5022fea0f6033e05fc694c21f30e4d3b16758035af4ce9da3bea7392320e0258"
  license "MIT"
  head "https://github.com/ChiragAgg5k/mailslot.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mailslot --version")
  end
end
