{pkgs, lib, config, ...}:
{
    programs.neovim = {
        enable = true;
	extraConfig = builtins.concatStringsSep "\n" [
	''
	lua << EOF
	${lib.strings.fileContents ./init.lua}
	EOF
	''
	];
   };
}
