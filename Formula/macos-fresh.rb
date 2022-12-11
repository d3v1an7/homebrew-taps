class MacosFresh < Formula
    include Language::Python::Virtualenv
    desc 'macos-fresh'
    homepage 'https://github.com/d3v1an7/macos-fresh'
    url 'https://github.com/d3v1an7/macos-fresh/releases/download/0.20.0/macos_fresh-0.20.0.tar.gz'
    sha256 '127eeb0a9c5b757bc3cc39bea3596fce1b6ba9118ebfa48aa16caa53b087c17d'
    version '0.20.0'
    depends_on 'python@3.11'
    def install
      venv = virtualenv_create(libexec, 'python3')
      system libexec/'bin/pip', 'install', '-v', '--ignore-installed', buildpath
      bin.install_symlink libexec/'bin/fresh' => 'fresh'
    end
    test do
      false
    end
  end