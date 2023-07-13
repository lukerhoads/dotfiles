{ pkgs ? import <nixpkgs> {}, ... }: {
    beautifuldiscord = pkgs.callPackage ./beautifuldiscord.nix {};
    i3-rounded-notitle = pkgs.callPackage ./i3-rounded-notitle.nix {};
}