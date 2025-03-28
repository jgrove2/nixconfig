{ pkgs, flakePath, ... }: {

	programs.bash = {
		shellAliases = {
			nix-rebuild = "sudo nixos-rebuild switch --flake ${flakePath}";
			home-rebuild = "home-manager switch --flake ${flakePath}";
		};

	};

}
