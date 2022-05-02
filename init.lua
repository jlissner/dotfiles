-- Install packer
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path }
end

vim.cmd [[packadd packer.nvim]]
vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  -- IDE-ish stuff
  use { -- start screen
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }
  use 'Shatur/neovim-session-manager' -- session manager

  use { -- file finder
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use { -- visualize buffer as tabs
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use { 'ojroques/nvim-bufdel' } -- better buffer management

  use { -- file explorer
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }
  -- utils
  use 'tpope/vim-surround' -- crud surrounds
  use 'tpope/vim-repeat' -- make repeat command work more predicably
  use 'tpope/vim-commentary' -- commenting and uncommenting stuff
  use 'karb94/neoscroll.nvim' -- smooth scrolling
  use 'ggandor/lightspeed.nvim' -- better motions
  use 'voldikss/vim-floaterm' -- have floating terminal
  use 'michaeljsmith/vim-indent-object' -- ai, aI, ii, iI

  use 'anuvyklack/nvim-keymap-amend';
  use{
    'anuvyklack/pretty-fold.nvim', -- pretty folds
    requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
    config = function()
      require('pretty-fold').setup{
        fill_char = '━',
          sections = {
            left = {
               '━━┫ ', 'content', '┣'
            },
            right = {
               '┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
            }
         }
      }
      require('pretty-fold.preview').setup()
     end
  }

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  -- git stuff
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- language stuff
  use 'sheerun/vim-polyglot'
  use 'neovim/nvim-lspconfig'
  use {
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    requires = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim' }
  }
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'jose-elias-alvarez/null-ls.nvim'
  use { 'nvim-telescope/telescope-ui-select.nvim' } -- so our code actions look much nicer

  -- org mode
  use 'nvim-orgmode/orgmode'

  -- themes
  use 'jacoborus/tender.vim'
  use 'rebelot/kanagawa.nvim'
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })
end)

require("options")

require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    offsets = {{ filetype = "NvimTree", text = "File Explorer", text_align = "left" }},
  }
})
require('neoscroll').setup()

require('dashboardConfig');

require("mappings")
require("lsp")
require("theme")
require("treesitter")
require("null_ls")
require("floaterm")
require("lua_line")
require("flest")
require("sessionManagerConfig")
require("orgmodeConfig");
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

require("nvim-tree").setup({
  disable_netrw = true,
  diagnostics = {
    enable = true
  },
  view = {
    width = 35
  }
})

require('bufdel').setup({
  next = 'alternate',
  quit = false,
})
