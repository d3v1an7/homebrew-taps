class MacosFresh < Formula
    include Language::Python::Virtualenv
    desc 'macos-fresh'
    homepage 'https://github.com/d3v1an7/macos-fresh'
    url 'https://github.com/d3v1an7/macos-fresh/releases/download/0.19.0/macos_fresh-0.19.0.tar.gz'
    sha256 '9721e23b71902932df5b868ffaaaf1d183c1bf993988b9b0cb8cc2bde92dd7b3'
    version '0.19.0'
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