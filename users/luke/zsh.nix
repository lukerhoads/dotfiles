{ config, pkgs, ... }:

let
  homeDir = config.homeDirectory;
in
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "gozilla";
    };
    shellAliases = {
      apply = "sh ~/.dotfiles/scripts/apply";
      update = "sh ~/.dotfiles/scripts/update";
      deps = "sh ~/.dotfiles/scripts/deps";
    };
  };
}
