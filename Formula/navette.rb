class Navette < Formula
  desc "The browser for agents — one tiny binary driving the OS WebView (MCP native)"
  homepage "https://github.com/slabbdev/navette"
  version "1.5.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/slabbdev/navette/releases/download/v1.5.0/navette-darwin-arm64"
    sha256 "9e7b13c161b8500bf2e90d202dae60ce7c239ef3946e4ac7cfcf37c3ca35e8ad"
  end

  def install
    bin.install "navette-darwin-arm64" => "navette"
  end

  def caveats
    <<~EOS
      This tap ships the macOS arm64 build. Windows and Linux: grab the
      release binary from https://github.com/slabbdev/navette/releases
      or run: cargo install navette-browser
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/navette --version")
  end
end
