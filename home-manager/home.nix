{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [

     outputs.homeManagerModules.packages
     #outputs.homeManagerModules.hyprland
     #outputs.homeManagerModules.hyprpaper
     outputs.homeManagerModules.neovim
     outputs.homeManagerModules.tmux
     #outputs.homeManagerModules.waybar
     outputs.homeManagerModules.alacritty
  ];
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "mega";
    homeDirectory = "/home/mega";
  };

  programs.tmux = {
	enable = true;
        extraConfig = ''
		unbind C-b
		set -g prefix C-a
		unbind r
		bind r source-file ~/.config/tmux.conf \; display "Reloaded ~/.tmux.conf"
		set -g base-index 1
		set -g pane-base-index 1
		set -g mouse on
		unbind v
		unbind h
		unbind % # Split vertically
		unbind '"' # Split horizontally
		bind v split-window -h -c "#{pane_current_path}"
		bind h split-window -v -c "#{pane_current_path}"
		#bind-key j run-shell 'popuptmux'
		bind c new-window -c "#{pane_current_path}"
		bind -n M-Space last-window
		bind -r C-j resize-pane -D 2
		bind -r C-k resize-pane -U 2
		bind -r C-h resize-pane -L 2
		bind -r C-l resize-pane -R 3
		bind -n C-h select-pane -L
		bind -n C-j select-pane -D
		bind -n C-k select-pane -U
		bind -n C-l select-pane -R
		'';
};


  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
