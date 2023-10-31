{ pkgs ? import <nixpkgs> { }, ... }: {
  i3-rounded-notitle = pkgs.callPackage ./i3-rounded-notitle.nix { };
}
