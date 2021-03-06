require('nvim-treesitter.configs').setup {
  ensure_installed = { "javascript", "markdown", "tsx", "scss", "org" },
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    disable = { "org" }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
    keymaps = {
      init_selection = "gti",
      node_incremental = "gti",
      -- scope_incremental = "grc",
      node_decremental = "gtI",
    }
  }
}

