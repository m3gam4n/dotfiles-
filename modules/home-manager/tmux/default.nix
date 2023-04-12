{pkgs, lib, config, ...}:
{
    programs.tmux = {
        enable = true;
        extraConfig =  ''
# default prefix
unbind C-b
set -g prefix C-a
# reload configuration
unbind r
bind r source-file ~/.config/tmux.conf \; display "Reloaded ~/.tmux.conf"
# pane number starts from 1 instead of 0
set -g base-index 1
set -g pane-base-index 1
set -g mouse on
#split windows on h and v
unbind v
unbind h
unbind % # Split vertically
unbind '"' # Split horizontally
bind v split-window -h -c "#{pane_current_path}"
bind h split-window -v -c "#{pane_current_path}"
# popup window
#bind-key j run-shell 'popuptmux'
# start new window in the same dir
bind c new-window -c "#{pane_current_path}"
# toggling windows
bind -n M-Space last-window
# resizing panels
bind -r C-j resize-pane -D 2
bind -r C-k resize-pane -U 2
bind -r C-h resize-pane -L 2
bind -r C-l resize-pane -R 3
# moving between panels
bind -n C-h select-pane -L
bind -n C-j select-pane -D
bind -n C-k select-pane -U
bind -n C-l select-pane -R
# List of plugins
#set -g @plugin 'tmux-plugins/tpm'
#set -g @plugin 'tmux-plugins/tmux-sensible'
#plugins :D
#set -g @plugin 'egel/tmux-gruvbox'
#set -g @tmux-gruvbox 'dark' # or 'light'
# save sessions
#set -g @plugin 'tmux-plugins/tmux-resurrect'
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
#run '~/.config/tmux/plugins/tpm/tpm'
'';
   };
}
