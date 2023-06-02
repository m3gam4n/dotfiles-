local map = vim.api.nvim_set_keymap
local opt = {
    noremap = true,
    silent = true
}
-- leader -> space
vim.g.mapleader = " "

--  nerdtree 
map("n","<leader>f",":NERDTreeToggle<CR>", opt)
-- bufferline running through buffers
map("n","<leader><tab>",":BufferLineCycleNext<CR>", opt)
-- killing buffers 
map("n","<leader>x",":bdelete<CR>", opt)
-- nerdcommenter -> not sure how to change from defualt leader+c or im just to fucking lazy...

 --prettier  

-- saving and escape  
map("n", "<leader>w", ':write<CR>', opt)
map("i", "kj", '<esc>', opt)
map("v", "kj", '<esc>', opt)

-- vertical split
map("n", "<leader>vv", ':vsplit<CR>', opt)

-- horizontal split 
map("n", "<leader>hh", ':split<CR>', opt)

-- movement 

