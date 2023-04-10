# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{
  # List your module files here
   packages = import ./packages.nix;
   hyprland = import ./hyprland.nix;
   hyprpaper = import ./hyprpaper.nix;
   alacritty = import ./alacritty.nix;
   neovim = import ./neovim.nix;
   waybar = import ./waybar.nix;
  tmux = import ./tmux.nix;
}
