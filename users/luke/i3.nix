{ config, pkgs, lib, ... }:

let 
  homeDir = "/home/luke";
in {
  xsession.windowManager.i3 = {
    package = pkgs.i3-rounded;
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "rofi -show drun";
      startup = [
        {
          command = "xrandr --output HDMI-1 --primary --pos 1080x350";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.feh}/bin/feh --no-startup-id --bg-fill /home/luke/wallpapers/cat_leaves.png";
          always = true;
          notification = false;
        }
        {
          command = "sh ${homeDir}/.dotfiles/users/luke/eww/bar/scripts/start";
          always = true;
          notification = false;
        }
        {
          command = "pacmd load-module module-switch-on-port-available";
          always = true;
          notification = false;
        }
      ];
      window.commands = [
        {
          command = "border pixel 0";
          criteria = { class = "^.*"; };
        }
      ];
      floating = { border = 0; };
      gaps = {
        inner = 15;
        outer = 5;
      };
      keybindings =
        let modifier = config.xsession.windowManager.i3.config.modifier;
        in lib.mkOptionDefault {
          "${modifier}+b" = "exec firefox";
          "${modifier}+Shift+s" = "exec systemctl suspend";
          "${modifier}+Shift+p" = "exec systemctl poweroff";
          "${modifier}+Shift+plus" = "exec amixer set 'Master' 5%+";
          "${modifier}+Shift+minus" = "exec amixer set 'Master' 5%-";
        };
      bars = [
        {
          position = "top";
          mode = "invisible";
        }
      ];
    };
    extraConfig = ''
      workspace 1 output HDMI-1
      workspace 2 output HDMI-1
      workspace 3 output HDMI-1
      workspace 4 output HDMI-1
      workspace 5 output HDMI-1
      workspace 6 output DP-1 
      workspace 7 output DP-1 
      workspace 8 output DP-1 
      workspace 9 output DP-1 
      workspace 10 output DP-1 
      border_radius 5   
    '';
  };
}
