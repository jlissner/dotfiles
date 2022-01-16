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
  use 'svermeulen/vim-subversive' -- better substitutes
  use 'voldikss/vim-floaterm' -- have floating terminal
  use {
    'abecodes/tabout.nvim', -- make <tab> more useful in insert mode
    config = function()
      require('tabout').setup {
          tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
          backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
          act_as_tab = true, -- shift content if tab out is not possible
          act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
          enable_backwards = true, -- well ...
          completion = true, -- if the tabkey is used in a completion pum
          tabouts = {
            {open = "'", close = "'"},
            {open = '"', close = '"'},
            {open = '`', close = '`'},
            {open = '(', close = ')'},
            {open = '[', close = ']'},
            {open = '{', close = '}'}
          },
          ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
          exclude = {} -- tabout will ignore these filetypes
      }
    end,
    wants = {'nvim-treesitter'}, -- or require if not used so far
    after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
  }

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

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('lualine').setup() end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
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

  -- testing utils
  use 'David-Kunz/jester'

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

  -- themes
  use 'jacoborus/tender.vim'
  use 'rebelot/kanagawa.nvim'
end)

require('neoscroll').setup()

require("options")
require("mappings")
require("lsp")
require("theme")
require("treesitter")
require("barbar")
require("null_ls")
require("floaterm")
-- require("nvim-tree") -- has bugs, not sure whats up
