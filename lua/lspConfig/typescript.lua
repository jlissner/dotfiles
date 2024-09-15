local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local lsp_formatting = function(bufnr)
--     vim.lsp.buf.format({
--         filter = function(clients)
--             -- filter out clients that you don't want to use
--             return vim.tbl_filter(function(client)
--                 return client.name ~= "tsserver"
--             end, clients)
--         end,
--         bufnr = bufnr,
--     })
-- end

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("lspconfig")['ts_ls'].setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local setBufferKeymap = function(mode, lhs, rhs, opts)
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        -- let null-ls take care of formatting 
        -- if client.supports_method("textDocument/formatting") then
            -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            -- vim.api.nvim_create_autocmd("BufWritePre", {
            --     group = augroup,
            --     buffer = bufnr,
            --     callback = function()
            --         lsp_formatting(bufnr)
            --     end,
            -- })
        -- end

        -- no default maps, so you may want to define some here
        local opts = { silent = true }
        setBufferKeymap('n', '<F12>', '<cmd>Telescope lsp_definitions<CR>', opts)
        setBufferKeymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
        setBufferKeymap('n', 'gts', '<cmd>Telescope lsp_document_symbols<CR>', opts)
        setBufferKeymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        setBufferKeymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        setBufferKeymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        setBufferKeymap('n', '<C-.>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        setBufferKeymap('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        setBufferKeymap('n', 'gte', '<cmd>w | Telescope diagnostics<CR>', opts)
        setBufferKeymap('n', '[e', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        setBufferKeymap('n', ']e', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        setBufferKeymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>', opts)
        setBufferKeymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

        -- available from nvim-lsp-ts-utils
        -- setBufferKeymap("n", "gs", ":TSLspOrganize<CR>", opts)
    end,
})
