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

  -- utils
  use 'tpope/vim-surround' -- crud surrounds
  use 'tpope/vim-repeat' -- make repeat command work more predicably
  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  } -- commenting and uncommenting stuff
  use 'karb94/neoscroll.nvim' -- smooth scrolling
  use 'ggandor/lightspeed.nvim' -- better motions

  -- file finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- project navigation
    use 'tpope/vim-vinegar'
  --[[ use { -- need to fix config before can use
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  } ]]

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

  -- theme
  use 'jacoborus/tender.vim'
end)

require('neoscroll').setup()

require("options")
require("mappings")
require("lsp")
require("theme")
require("treesitter")
-- require("nvim-tree") -- has bugs, not sure whats up
