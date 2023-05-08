{pkgs, lib, config, ...}:
{
    programs.neovim = {
	extraLuaConfig = ''
		local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
		if not vim.loop.fs_stat(lazypath) then
		  vim.fn.system({
		    "git",
		    "clone",
		    "--filter=blob:none",
		    "https://github.com/folke/lazy.nvim.git",
		    "--branch=stable", -- latest stable release
		    lazypath,
		  })
		end
		vim.opt.rtp:prepend(lazypath)

		vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

		require("lazy").setup({
		-- coc autocomplete
		  {
		  url = "https://github.com/neoclide/coc.nvim",
		  branch = "release",
		    conifg = function()
		    require('coc.lua').setup()
		   end,
		},

		-- global settings
		-- currently not working settings is not in runtime path :c
		-- require('lua/settings').setup{}

		-- plugins
		-- oceanic-next
		{url = "https://github.com/mhartington/oceanic-next"},

		-- oceanic-material
		{url = "https://github.com/nvimdev/oceanic-material"},

        -- gruvbox
		{url = "https://github.com/morhetz/gruvbox"},

		-- html syntax
		{url = "https://github.com/othree/html5.vim"},
		{url = "https://github.com/othree/xml.vim"},
		-- nerdtree
		{
		  url = "https://github.com/preservim/nerdtree",
		   keys = {
		     {"<leader>f", "<cmd>:NERDTreeToggle<Enter>", desc="toogle nerdtree"},
		   },
		   opts = {
		    NERDTreeMinimalUI =1,
		    NERDTreeDirArrows =1
		   }
		},
        -- gitsigns  
	{
            url = "https://github.com/lewis6991/gitsigns.nvim",
            config = function()
	    	require('gitsigns').setup()	
		end,
        },

		-- cool indents :D
		{url = "https://github.com/Yggdroot/indentLine"},
		-- auto brackets
		{url = "https://github.com/jiangmiao/auto-pairs"},
		-- cool comments
		{
		url = "https://github.com/preservim/nerdcommenter",
		keys = {
		     {"<leader-_><plug>", "<cmd>:NERDCommenterToogle", desc="comment"},
		   }
		},

		-- bufferline
		{'akinsho/bufferline.nvim', version = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons'},
		})
		local set = vim.opt
        set.syntax  = on
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
		-- set.backspace

		-- colorscheme idk why set.colorscheme doesn't work :(
		vim.cmd[[colorscheme oceanic_material]]
		vim.api.nvim_set_keymap('n', '<Leader>w', ':write<Enter>', {})
		vim.api.nvim_set_keymap('n', '<Leader>r', ':redraw!<Enter>', {})
		vim.api.nvim_set_keymap('i','kj','esc>', {noremap = true})
		vim.api.nvim_set_keymap('v','kj','esc>', {noremap = true})
	'';
        enable = true;
 };
}
