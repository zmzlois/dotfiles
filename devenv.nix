{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ 
      pkgs.neovim
      # pkgs.redis
      # pkgs.vector
      # pkgs.watchman
      nixpkgs-master.legacyPackages.aarch64-darwin.cargo-lambda
      nixpkgs-master.legacyPackages.aarch64-darwin.cargo-tauri
      nixpkgs-master.legacyPackages.aarch64-darwin.plow
      pkgs.ack
      pkgs.act
      pkgs.age
      pkgs.awscli2
      pkgs.bun
      pkgs.caddy
      pkgs.cairo
      pkgs.cargo-nextest
      pkgs.cargo-sweep
      pkgs.cargo-watch
      pkgs.cargo-zigbuild
      pkgs.certstrap
      pkgs.cmake
      pkgs.colima
      pkgs.cowsay
      pkgs.curl
      pkgs.direnv
      pkgs.docker
      pkgs.docker-compose
      pkgs.duti
      pkgs.emacs
      pkgs.eza
      pkgs.fclones
      pkgs.fd
      pkgs.ffmpeg
      pkgs.fnm
      pkgs.fx
      pkgs.fzf
      pkgs.gawk
      pkgs.gh
      pkgs.git
      pkgs.git-lfs
      pkgs.git-trim
      pkgs.gitui
      pkgs.glow
      pkgs.gnupg
      pkgs.gnused
      pkgs.gnutls
      pkgs.go
      pkgs.gomplate
      pkgs.graphicsmagick
      pkgs.graphviz
      pkgs.helix
      pkgs.hexyl
      pkgs.htop
      pkgs.httpstat
      pkgs.hyperfine
      pkgs.imagemagick
      pkgs.inetutils
      pkgs.ipcalc
      pkgs.irssi
      pkgs.jq
      pkgs.jwt-cli
      pkgs.k3d
      pkgs.k9s
      pkgs.kubectl
      pkgs.lazydocker
      pkgs.lazygit
      pkgs.less
      pkgs.libavif
      pkgs.lnav 
      pkgs.ncdu
      pkgs.neofetch
      pkgs.ngrok
      pkgs.nix-prefetch-github
      pkgs.nixpkgs-fmt
      pkgs.nodePackages_latest.aws-cdk
      pkgs.parallel
      pkgs.psutils
      pkgs.pulumi
      pkgs.pv
      pkgs.python312Packages.huggingface-hub
      pkgs.ripgrep
      pkgs.rsync
      pkgs.rustup
      pkgs.scrcpy
      pkgs.sea-orm-cli
      pkgs.smartmontools
      pkgs.speedtest-cli
      pkgs.stow
      pkgs.stylua
      pkgs.subversion
      pkgs.terraform
      pkgs.tmux
      pkgs.tree
      pkgs.trippy
      pkgs.trivy
      pkgs.typeshare
      pkgs.upx
      pkgs.wget
      pkgs.yq
      pkgs.yubikey-manager
      pkgs.yubikey-personalization
      pkgs.zellij
      pkgs.zig
      pkgs.zoxide
      pkgs.zsh ];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  enterShell = ''
    hello
    git --version
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep "2.42.0"
  '';

  cachix.enable = false;

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
