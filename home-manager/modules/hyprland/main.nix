{ pkgs, lib, inputs, environment, ... }:{

	programs.kitty.enable = true;
	xdg.portal.enable = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
