{ config, pkgs, outputs, ... }:

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
    ./spicetify.nix
    ./direnv.nix
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
    git-credential-manager
    dbus
    spicetify-cli
    discord
    weather
    niv
    unzip
    outputs.packages.i3-rounded-notitle
    obs-studio
  ];

  programs.home-manager.enable = true;
}
