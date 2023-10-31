{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Luke Rhoads";
    userEmail = "pumpkineater661@gmail.com";
    extraConfig = {
      init = { defaultBranch = "main"; };
      credential.helper = "manager";
      credential.credentialStore = "gpg";
      http.postBuffer = "524288000";
    };
  };
}
