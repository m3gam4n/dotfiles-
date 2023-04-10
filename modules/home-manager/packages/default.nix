{ inputs, outputs, lib, config, pkgs, ... }: {
   home.packages = with pkgs; [ 
	#firefox
	#vim 
	#neovim
	git
	#home-manager
	#htop
	#tmux 
	#virt-manager
	#qemu
	#docker
	#hyprpaper
	#alacritty
	#obsidian
	#waybar
	#lua
	#nodejs
 ];
}
