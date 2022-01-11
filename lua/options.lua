vim.o.compatible = false
vim.o.encoding = "utf-8"
vim.o.backspace = "indent,eol,start" -- backspace works on every char in insert mode
vim.o.hidden = true
vim.o.clipboard = 'unnamedplus' -- use system clipboard by default
vim.o.mouse = 'a'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.shell = "cmd"
vim.o.termguicolors = true

-- set ripgrep as grep engine
vim.o.grepprg="rg --vimgrep --no-heading --smart-case"
vim.o.grepformat="%f:%l:%c:%m"

-- line numbers
vim.wo.number = true
vim.o.numberwidth = 4
vim.wo.signcolumn = 'number' -- Display signs in the number column

-- white characters
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 2 -- 1 tab = 2 spaces
vim.o.shiftwidth = 2 -- indentation rule
vim.o.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.o.expandtab = true -- expand tab to spaces

vim.o.wrap = false
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- splits
vim.o.splitright = true
vim.o.splitbelow = true

-- fold level stuff
vim.o.foldlevel = 12
vim.o.foldmethod = "manual"

-- see whats happening while substituting
vim.o.inccommand = "nosplit"

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { 'help' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile', 'packer'}
vim.g.indent_blankline_char_highlight = 'LineNr'

-- set space to <leade>
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

