require'lspconfig'.rnix.setup{}
require'lspconfig'.sumneko_lua.setup{}
require'lspconfig'.zk.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.cssls.setup{}

vim.o.completeopt = "menuone,noselect"

require'compe'.setup{
enabled = true;
autocomplete = true;
debug = false;
min_length = 1;
preselect = 'enable';
throttle_time = 80;
source_timeout = 200;
incomplete_delay = 400;
max_abbr_width = 100;
max_kind_width = 100;
max_menu_width = 100;
documentation = true;
source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    tags = true;
    treesitter = true;
 };
}

-- autocomplete 
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})


require("lspconfig").tsserver.setup {
  on_attach = function(client)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false
    set_lsp_config(client)
  end
}

