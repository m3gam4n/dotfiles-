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
-- oceanic next 
{url = "https://github.com/mhartington/oceanic-next"},
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
