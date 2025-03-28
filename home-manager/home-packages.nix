{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = false;

	home.packages = with pkgs; [
		# Desktop
		firefox
		chromium
		kitty
		ghostty
		bitwarden-desktop

		# CLI
		git
		gh
		# Hyprland
		rofi-wayland
		waybar
		dunst
		libnotify
		swww # wallpaper

		# Font
		iosevka
		(nerdfonts.override { fonts = [ "Iosevka" ]; })
	];
}
