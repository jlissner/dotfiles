require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.prettier,
        require("null-ls").builtins.diagnostics.eslint,
    },
    on_attach = function(client)
        -- if client.server_capabilities.document_formatting then
        --     vim.cmd([[
        --         augroup LspFormatting
        --             autocmd! * <buffer>
        --             autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ timeout_ms = 2000 })
        --         augroup END
        --     ]])
        -- end
    end
})
