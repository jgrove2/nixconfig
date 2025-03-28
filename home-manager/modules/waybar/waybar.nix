  {
  pkgs,
  lib,
  host,
  config,
  ...
}: {
    # Configure & Theme Waybar
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
      style = builtins.readFile ../waybar/style.css;
      settings = [
        {
          layer = "top";
          position = "top";
	  reload_style_on_change = true;
          modules-center = ["hyprland/workspaces"];
          modules-left = [
	    "pulseaudio"
	    "network"
	    "temperature"
          ];
          modules-right = [
            "group/expand"
            "bluetooth"
            "battery"
	    "clock"
          ];
          "hyprland/workspaces" = {
            format = "{icon}";
            format-icons = {
              active = "";
              default = "";
              empty = "";
            };
	    "persistent-workspaces" = {
		"*" = [
			1
			2
			3
			4
			5
		];
	    };
          };
	  "bluetooth" = {
		format-on = "󰂯";
		format-off = "BT-off";
		format-disabled = "󰂲";
		format-connected-battery = "{device_battery_percentage}% 󰂯";
		format-alt = "{device_alias} 󰂯";
		tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
		on-click-right = "blueman-manager";
	  };
          "clock" = {
            format = "{:%I:%M:%S %p} ";
	    interval = 1;
            tooltip-format = "<tt>{calendar}</tt>";
	    calendar = {
		format = {
			today = "<span color='#fAfBfC'><b>{}</b></span>";
		};
	    };
	    actions = {
		on-click-right = "shift_down";
		on-click = "shift_up";
	    };
          };
          "hyprland/window" = {
            max-length = 22;
            separate-outputs = false;
            rewrite = {
              "" = " 🙈 No Windows? ";
            };
          };
          "memory" = {
            format = "";
          };
          "cpu" = {
            format = " {usage:2}%";
            tooltip = true;
          };
          "disk" = {
            format = " {free}";
            tooltip = true;
          };
          "network" = {
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            format-ethernet = " {bandwidthDownOctets}";
            format-wifi = "{icon} {signalStrength}%";
            format-disconnected = "󰤮";
            tooltip = false;
	    on-click = "ghostty nmtui";
          };
	  "custom/endpoint" = {
		format = "|";
		tooltip = false;
	  };
	  "custom/expand" = {
		format = "";
		tooltip = false;
	  };
          "tray" = {
            spacing = 10;
	    icon-size = 14;
          };
	  "temperature" = {
		critical-threshold = 80;
		format = " {temperatureC}°C";
	  };
          "pulseaudio" = {
            format = "{icon} {volume}% {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = " {volume}%";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                ""
              ];
            };
            on-click = "sleep 0.1 && pavucontrol";
          };
          "custom/exit" = {
            tooltip = false;
            format = "";
            on-click = "sleep 0.1 && wlogout";
          };
          "custom/hyprbindings" = {
            tooltip = false;
            format = "󱕴";
            on-click = "sleep 0.1 && list-keybinds";
          };
          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";

            };
            tooltip = "true";
          };
          "custom/notification" = {
            tooltip = false;
            format = "{icon} {}";
            format-icons = {
              notification = "<span foreground='red'><sup></sup></span>";
              none = "";
              dnd-notification = "<span foreground='red'><sup></sup></span>";
              dnd-none = "";
              inhibited-notification = "<span foreground='red'><sup></sup></span>";
              inhibited-none = "";
              dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
              dnd-inhibited-none = "";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "sleep 0.1 && task-waybar";
            escape = true;
          };
          "battery" = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = "󰂄 {capacity}%";
            format-plugged = "󱘖 {capacity}%";
            format-icons = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            on-click = "";
            tooltip = false;
          };
          "custom/arrow1" = {
            format = "";
          };
          "custom/arrow2" = {
            format = "";
          };
          "custom/arrow3" = {
            format = "";
          };
          "custom/arrow4" = {
            format = "";
          };
          "custom/arrow5" = {
            format = "";
          };
          "custom/arrow6" = {
            format = "";
          };
          "custom/arrow7" = {
            format = "";
          };
        }
      ];
    };
  }

