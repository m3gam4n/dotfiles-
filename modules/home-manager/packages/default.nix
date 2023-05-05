{ inputs, lib, config, pkgs, ... }: {
   home.packages = with pkgs; [ 
	firefox
	vim 
	htop
	virt-manager
	qemu
	docker
	obsidian
	waybar
	lua
	nodejs
	terminus-nerdfont
    terminus_font
    hyprpaper
	wofi
    wayland
 ];
}
