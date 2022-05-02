local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "                                                     ",
    "                                                     ",
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "l", "🚀 > Open Last Session", ":SessionManager load_last_session<CR>"),
    dashboard.button( "p", "⭐ > Pick Session", ":SessionManager load_session<CR>"),
    dashboard.button( "e", "📜 > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "r", "🕒 > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "c", "🎨 > Color Sheme"   , ":Telescope colorscheme<CR>"),
    dashboard.button( "s", "⚙  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "❌ > Quit NVIM", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
vim.api.nvim_exec([[
  autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
]], false)
