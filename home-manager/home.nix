{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [

     outputs.homeManagerModules.packages
     #outputs.homeManagerModules.hyprland
     #outputs.homeManagerModules.hyprpaper
     outputs.homeManagerModules.neovim
     outputs.homeManagerModules.tmux
     outputs.homeManagerModules.waybar
     outputs.homeManagerModules.alacritty
     #outputs.homeManagerModules.wofi
     #outputs.homeManagerModules.pulseaudio
     #outputs.homeManagerModules.backlight
     outputs.homeManagerModules.git

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

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
