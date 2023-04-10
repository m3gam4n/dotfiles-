{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
     outputs.homeManagerModules.packets
     outputs.homeManagerModules.hyprland
     outputs.homeManagerModules.hyprpaper
     outputs.homeManagerModules.neovim
     outputs.homeManagerModules.tmux
     outputs.homeManagerModules.waybar
     outputs.homeManagerModules.alacritty

    # ./users.nix
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
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
