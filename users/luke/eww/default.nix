{ config, pkgs, ... }:

{
  programs.eww = {
    enable = true;
    configDir = /home/luke/.dotfiles/users/luke/eww;
  };
}
