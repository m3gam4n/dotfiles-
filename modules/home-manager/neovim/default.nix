{pkgs, lib, config, ...}:
{
#home.file.".config/nvim/settings.lua".source = ./init.lua;
#luafile $NIXOS_CONFIG_DIR/modules/home-manager/neovim/lua/lsp-config.lua
#luafile $NIXOS_CONFIG_DIR/modules/home-manager/neovim/lua/pugins.lua
#luafile $NIXOS_CONFIG_DIR/modules/home-manager/neovim/lua/whichkey.lua
#luafile $NIXOS_CONFIG_DIR/modules/home-manager/neovim/lua/treesitter.lua
programs.neovim = {
            enable = true;
            extraConfig = ''
	    	luafile $NIXOS_CONFIG_DIR/modules/home-manager/neovim/lua/settings.lua
	    	luafile $NIXOS_CONFIG_DIR/modules/home-manager/neovim/lua/bufferline.lua
	    	luafile $NIXOS_CONFIG_DIR/modules/home-manager/neovim/lua/lsp.lua
            '';
            plugins = with pkgs.vimPlugins; [ 
                    #syntax
        		    vim-nix
                    vim-javascript
                    vim-jsx-typescript

                    nvim-autopairs
                    #colorschemes
                    tokyonight-nvim

                    nerdtree
                    nerdtree-git-plugin

                    #lsp 
                    nvim-compe
                    nvim-lspconfig

                    nvim-treesitter
                    bufferline-nvim

                    
                {
                    plugin = lualine-nvim;
                    config = "lua require('lualine').setup()";
                }
                {
                    plugin = telescope-nvim;
                    config = "lua require('telescope').setup()";
                }
                {
                    plugin = indent-blankline-nvim;
                    config = "lua require('indent_blankline').setup()";
                }

            ];

        };
}
