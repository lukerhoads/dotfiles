{ config, pkgs, inputs, ... }:

{
  imports = [
    ./i3.nix
    ./alacritty.nix
    ./picom.nix
    ./zsh.nix
    ./firefox.nix
    ./git.nix
    ./gpg.nix
    ./vscode.nix
    ./rofi
    ./eww
  ];

  home.username = "luke";
  home.homeDirectory = "/home/luke";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    i3lock
    i3blocks
    feh
    rofi
    alacritty
    firefox
    neovim
    picom
    git
    zsh
    git-crypt
    gnupg
    pinentry_qt
    vscode
    killall
    eww
    xclip 
    xdotool
    maim
    jq
    lxqt.pavucontrol-qt
  ];

  programs.home-manager.enable = true;
}
