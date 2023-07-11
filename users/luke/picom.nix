{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
    shadow = true;
    shadowOpacity = 0.8;
    settings = {
      blur = {
        method = "dual_kawase";
        size = 20;
        deviation = 5.0;
        kernel = "11x11gaussian";
      };
    };
    opacityRules = [
      "99:fullscreen"
      "100:class_g = 'Alacritty' && focused"
      "100:class_g = 'Alacritty' && !focused"
      "100:class_g = 'Firefox' && focused"
      "100:class_g = 'Firefox' && !focused"
    ];
  };
}
