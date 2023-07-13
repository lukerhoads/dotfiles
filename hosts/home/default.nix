{ config, pkgs, home-manager, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "home";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];
  users.users.luke = {
    isNormalUser = true;
    description = "Luke Rhoads";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    zsh
  ];

  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    windowManager.i3.enable = true;
    layout = "us";
  };
  services.gnome.gnome-keyring.enable = true;

  users.defaultUserShell = pkgs.zsh;

  hardware.opengl.enable = true;
  hardware.pulseaudio.enable = true;

  sound.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
    polybar = pkgs.polybar.override {
      i3Support = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.pulseaudio = true;

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

  fonts = {
    fonts = with pkgs; [
      cantarell-fonts
      fira
      lato
      maple-mono
      maple-mono-NF
      maple-mono-SC-NF
      material-symbols
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto-slab
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        autohint = true;
        style = "full";
      };

      subpixel.lcdfilter = "default";

      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "Maple Mono NF" ];
        sansSerif = [ "Lato" ];
        serif = [ "Roboto Slab" ];
      };
    };
  };

  system.stateVersion = "23.05";
}
