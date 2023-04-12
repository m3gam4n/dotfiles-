{ inputs, outputs, lib, config, pkgs, ... }:
{
   home.file."$HOME/.config/hypr/hyprland.conf".source = ./hyprland.conf;
}
