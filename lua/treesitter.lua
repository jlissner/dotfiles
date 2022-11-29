require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "javascript",
    "markdown",
    "tsx",
    "scss",
    "org",
    "lua",
    "vim",
    "bash",
    "markdown_inline",
    "regex"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "org" } -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar,
  },
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

