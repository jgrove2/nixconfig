{ pkgs, config, ... }: {
	programs.tmux = {
		enable = true;
		plugins = with pkgs; [
			tmuxPlugins.sensible
		];
	};
}
