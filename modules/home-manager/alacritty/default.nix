{pkgs, ...}: {
programs.alacritty = {
	enable = true;
  };
  home.file.".config/alacritty/alacritty.yml".source = ./alacritty.yaml;
}

