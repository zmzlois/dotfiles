({ config, profile, username, hostname, lib, pkgs, nixpkgs-master, ... }: {

   system.activationScripts.preActivation = {
    enable = true;
    text = ''
      if [ ! -L "/usr/local/bin/gsed" ]; then
        sudo ln -s $(which sed) /usr/local/bin/gsed
        echo "Symbolic link created for gsed."
      fi

      open -a Docker

  
      timeout 10s sh -c 'until docker info >/dev/null 2>&1; do sleep 1; done' && echo "Docker daemon is running" || echo "Failed to start Docker daemon in 10 seconds"

      echo "Starting postgres database in medusa..."
      docker start medusa

    '';
  };

   system.activationScripts.postActivation = {
    enable = true;
    text = ''
      # Stop postgres database in medusa container
      echo "Stopping postgres database in medusa..."
      docker stop medusa

      # Ensure Docker containers are stopped
      echo "Stopping all running Docker containers..."
      docker container stop $(docker container ls -q)

      # Stop Docker daemon
      echo "Stopping Docker daemon..."
      osascript -e 'quit app "Docker"'
    '';
  };
  services = { };

  environment = {
    systemPackages = [
      pkgs.coreutils
    ];
  };


  home = {
    packages = [
      pkgs.aws-iam-authenticator
      pkgs.lua51Packages.busted
      pkgs.lua51Packages.lua
      pkgs.lua51Packages.luacheck
      pkgs.lua51Packages.luafilesystem
      pkgs.lua51Packages.luarocks
    ];
  };

  fonts = {
    packages =
      [
        (pkgs.nerdfonts.override {
          fonts = [
            "JetBrainsMono"
            "GeistMono"
          ];
        })
      ];
  };



# Don't need this for work for now
  # programs = {
    # zsh = {
    #  shellAliases = {
     #   dsf = "/Users/$(whoami)/Projects/vercel/deploy-single-file/bin/deploy-single-file";
    #  };
   # };
  #};
})
