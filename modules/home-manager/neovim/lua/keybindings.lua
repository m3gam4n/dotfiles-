local map = vim.api.nvim_set_keymap
local opt = {
    noremap = true,
    silent = true
}

-- leader -> space
vim.g.mapleader = " "

--  nerdtree 
map("n","<leader>f",":NERDTreeToggle<CR>", opt)
map("n","<leader><tab>",":BufferLineCycleNext<CR>", opt)
map("n","<leader>x",":bdelete<CR>", opt)


