{pkgs, lib, config, ...}:
{
    programs.neovim = {
        enable = true;
	extraLuaConfig = ''
		local set = vim.opt
		set.number = true
		set.ignorecase = true
		set.smartcase = true
		set.visualbell = true
		set.expandtab = true
		set.tabstop = 4
		set.smartindent = true
		set.shiftwidth = 4
		set.autoindent = true
		set.termguicolors = true
		require('bufferline').setup{}
		set.mouse=a
		vim.cmd[[colorscheme OceanicNext]]
		vim.api.nvim_set_keymap('n', '<Leader>w', ':write<Enter>', {})
		vim.api.nvim_set_keymap('n', '<Leader>r', ':redraw!<Enter>', {})
		vim.api.nvim_set_keymap('i','kj','esc>', {noremap = true})
		vim.api.nvim_set_keymap('v','kj','esc>', {noremap = true})
	'';

	plugins = with pkgs.vimPlugins; [ 
	oceanic-next
	nerdtree
	coc-python
	coc-html
	auto-pairs
	vim-bufferline
	indentLine
	html5-vim
   ];
 };
}
