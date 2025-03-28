{ homeStateVersion, user, pkgs, lib, ...}:
{
	home = {
		username = user;
		homeDirectory = "/home/${user}";
		stateVersion = homeStateVersion;
	};

	fonts.fontconfig.enable = true;

	imports = [
		./modules
		./home-packages.nix
	];
		
}
