class MacosFresh < Formula
  desc "Super opinionated tools, apps and defaults for macOS"
  homepage "https://github.com/d3v1an7/macos-fresh"
  url "https://github.com/d3v1an7/macos-fresh/releases/download/1.0.7/macos-fresh-1.0.7.tar.gz"
  sha256 "2a510e1873a2c68a91d3afdcb70c91dd299936f43724184768f6f54bb9df77a9"
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
