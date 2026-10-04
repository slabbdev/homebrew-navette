class Navette < Formula
  desc "The browser for agents — one tiny binary driving the OS WebView (MCP native)"
  homepage "https://github.com/slabbdev/navette"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slabbdev/navette/releases/download/v1.4.0/navette-darwin-arm64"
      sha256 "f9ee99692bd77ad66def4311fc5b01b270a616efa7dc96d7ce8fcd373ebafb36"
    end
  end

  def install
    bin.install "navette-darwin-arm64" => "navette" if OS.mac?
  end

  def caveats
    <<~EOS
      The macOS arm64 build is provided. For Windows and Linux, grab the
      release binary directly or use cargo:
        cargo install navette-browser
    EOS
  end

  test do
    assert_match "navette", shell_output("#{bin}/navette --help") rescue system("#{bin}/navette", "--help")
  end
end
