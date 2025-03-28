{
	description = "My system configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland.url = "github:hyprwm/Hyprland";
	};

	outputs = { nixpkgs, home-manager, ... } :
		let
			system = "x86_64-linux";
			user = "jgrove";
			homeStateVersion = "24.11";
			flakePath = "~/.config/nix";
		in {
			nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
				inherit system;
				modules = [ ./nixos/configuration.nix ];
			};

			homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.${system};
				extraSpecialArgs = {
					inherit homeStateVersion user flakePath;
				};

				modules = [ ./home-manager/home.nix ];
			};
		};
}
