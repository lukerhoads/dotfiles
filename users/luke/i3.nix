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
          command = "${pkgs.feh}/bin/feh --no-startup-id --bg-fill /home/luke/Pictures/wallpapers/cat_leaves.png";
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
          "${modifier}+Shift+b" = "exec firefox";
          "${modifier}+Shift+s" = "exec systemctl suspend";
          "${modifier}+Shift+p" = "exec systemctl poweroff";
          "${modifier}+v+plus" = "exec amixer set 'Master' 5%+";
          "${modifier}+v+minus" = "exec amixer set 'Master' 5%-";
          "${modifier}+Shift+m" = "exec --no-startup-id i3-msg 'workspace 5'; exec spotify";
          "${modifier}+z" = "split horizontal";
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";
          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";
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
      for_window [class="Spotify"] floating enable
      for_window [class="Spotify"] resize set width 1200px
      for_window [class="Spotify"] move position center
      for_window [class="Discord"] move to workspace 4
      for_window [class="Discord"] resize set width 1200px
    '';
  };
}
