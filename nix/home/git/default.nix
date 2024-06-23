{ config, pkgs, lib, libs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Zhaomian Zhao";
    userEmail = "loisisar@icloud.com";

    delta = {
      enable = true;
      options = {
        syntax-theme = "TwoDark";
        side-by-side = true;
      };
    };

    extraConfig = {
      github = {
        user = "zmzlois";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = false;
      };
      push = {
        autoSetupRemote = true;
      };
      core = {
        editor = "nvim";
        fileMode = false;
        ignorecase = false;
      };
    };
  };
}
