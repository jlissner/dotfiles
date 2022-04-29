require('nvim-treesitter.configs').setup {
  ensure_installed = { "javascript", "markdown", "tsx", "scss" },
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gti",
      node_incremental = "gti",
      -- scope_incremental = "grc",
      node_decremental = "gtI",
    }
  }
}

