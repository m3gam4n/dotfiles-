{pkgs, lib, config, ...}:
{
    programs.tmux = {
        enable = true;
        extraConfig =  import ./tmux.conf;
   }
}
