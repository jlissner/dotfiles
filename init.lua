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

  -- start screen
  use 'mhinz/vim-startify'

  -- utils
  use 'tpope/vim-surround' -- crud surrounds
  use 'tpope/vim-repeat' -- make repeat command work more predicably
  use { -- commenting and uncommenting stuff
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }
  use 'karb94/neoscroll.nvim' -- smooth scrolling
  use 'ggandor/lightspeed.nvim' -- better motions
  use{ 'anuvyklack/pretty-fold.nvim', -- pretty folds
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
        require('pretty-fold.preview').setup_keybinding('h')
     end
  }
  use { 
    'nvim-neorg/neorg',
    config = function()
        require('neorg').setup {
            -- Tell Neorg what modules to load
            load = {
                ['core.defaults'] = {}, -- Load all the default modules
                ['core.norg.concealer'] = {}, -- Allows for use of icons
                ['core.norg.dirman'] = { -- Manage your directories with Neorg
                    config = {
                        workspaces = {
                            my_workspace = '~/neorg'
                        }
                    }
                },
                ['core.norg.completion'] = {
                    config = {
                        engine = 'nvim-cmp'
                    }
                },
                ["core.keybinds"] = {
                   config = {
                     default_keybinds = true
                   }
                },
            },
        }
    end,
    requires = 'nvim-lua/plenary.nvim'
  }

  -- file finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- project navigation
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
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
  use 'jose-elias-alvarez/null-ls.nvim'

  -- theme
  use 'jacoborus/tender.vim'
end)

require('neoscroll').setup()

require("options")
require("mappings")
require("lsp")
require("theme")
require("treesitter")
require("barbar")
-- require("nvim-tree") -- has bugs, not sure whats up
