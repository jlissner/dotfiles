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

require("options")

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
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- utils
  use "lukas-reineke/indent-blankline.nvim" -- view indents better
  use 'tpope/vim-surround' -- crud surrounds
  use 'tpope/vim-fugitive' -- git stuff
  use 'tpope/vim-repeat' -- make repeat command work more predicably
  use { -- commenting and uncommenting stuff
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  use 'karb94/neoscroll.nvim' -- smooth scrolling
  use 'ggandor/lightspeed.nvim' -- better motions
  use 'voldikss/vim-floaterm' -- have floating terminal
  use 'michaeljsmith/vim-indent-object' -- ai, aI, ii, iI
  use 'mizlan/iswap.nvim' -- :ISwap to swap swappable things
  use 'ThePrimeagen/harpoon' -- Go between common files faster

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
  use 'jose-elias-alvarez/typescript.nvim'
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
  use 'sainnhe/everforest'
  use 'folke/tokyonight.nvim'
  use 'morhetz/gruvbox'
  use 'lifepillar/vim-solarized8'
  use 'projekt0n/github-nvim-theme'
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })
end)


require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    offsets = {{ filetype = "neo-tree", text = "File Explorer", text_align = "left" }},
  }
})
require('neoscroll').setup()

require('dashboardConfig');

require("mappings")
require("cmpConfig")
require("typescriptConfig")
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

require('bufdel').setup({
  next = 'alternate',
  quit = false,
})

vim.opt.list = true

require("indent_blankline").setup {
    show_current_context = true,
    show_end_of_line = true,
}
require('lspConfig/css');
