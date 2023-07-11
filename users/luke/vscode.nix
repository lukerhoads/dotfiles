{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "yuck";
        publisher = "eww-yuck";
        version = "0.0.3";
        sha256 = "sha256-DITgLedaO0Ifrttu+ZXkiaVA7Ua5RXc4jXQHPYLqrcM=";
      }
      {
        name = "catppuccin-vsc";
        publisher = "catppuccin";
        version = "2.7.0";
        sha256 = "sha256-uUisQ8ULeP0bVpK8iZOBmu7WENGZSi0DLrmv8HsmEtA=";
      }
    ];
  };
}

