{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = false;

	home.packages = with pkgs; [
		# Desktop
		firefox
		chromium
		kitty
		ghostty
		bitwarden-desktop
		requestly

		# CLI
		git
		gh
		neovim
		gnumake
		unzip
		gcc
		wl-clipboard
		fd
		ripgrep
		libgcc
		tmux

		# Hyprland
		rofi-wayland
		waybar
		dunst
		libnotify
		swww # wallpaper

		# Font
		iosevka
		(nerdfonts.override { fonts = [ "Iosevka" ]; })

		# Programming Languages
		go
		nodejs_23
		lua

		# System
		pavucontrol
		nix-ld
	];
}
