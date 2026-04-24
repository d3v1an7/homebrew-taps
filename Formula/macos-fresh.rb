class MacosFresh < Formula
  desc "Super opinionated tools, apps and defaults for macOS"
  homepage "https://github.com/d3v1an7/macos-fresh"
  url "https://github.com/d3v1an7/macos-fresh/releases/download/1.0.6/macos-fresh-1.0.6.tar.gz"
  sha256 "a7c14486bdca217545c83ac99811c016ab9d15741649f41d7bba5247b8427ad0"
  license "GLWTPL"
  depends_on "node"

  def install
    libexec.install "dist/fresh.mjs"
    prefix.install "package.json"
    (bin/"fresh").write <<~EOS
      #!/bin/sh
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/fresh.mjs" "$@"
    EOS
    chmod 0755, bin/"fresh"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/fresh --help")
  end
end
