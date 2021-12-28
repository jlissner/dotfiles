local opts = { noremap = true, silent = true }

function mapKey(mode, lhs, rhs, opts) 
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function nnoremap(lhs, rhs, opts) mapKey("n", lhs, rhs, opts) end
function vnoremap(lhs, rhs, opts) mapKey("v", lhs, rhs, opts) end
function inoremap(lhs, rhs, opts) mapKey("i", lhs, rhs, opts) end

-- refresh settings
mapKey("n", "<F5>", ":source ~/AppData/Local/nvim/init.lua<CR>",  { noremap = true })

-- saves
mapKey("n", "<C-s>", ":w <CR>",  { noremap = true })
mapKey("v", "<C-s>", "<ESC>:w <CR>",  { noremap = true })
mapKey("i", "<C-s>", "<ESC>:w <CR>li",  { noremap = true })

-- clear highlight on esc
mapKey("n", "<ESC>", "<ESC>:noh<CR>", opts)
mapKey("v", "<ESC>", "<ESC>:noh<CR>", opts)
mapKey("i", "<ESC>", "<ESC>:noh<CR>", opts)

-- commenting and uncommenting stuff
mapKey("n", "<C-/>", "mtgcc`t", { silent = true })
mapKey("v", "<C-/>", "gbgv", { silent = true })
mapKey("i", "<C-/>", "<ESC>mtgc`ta", { silent = true })

-- window splitting
mapKey("n", "<leader>v", "<C-w>v<C-w>l:Explore<CR>", opts)
mapKey("n", "<leader>s", "<C-w>s<C-w>j:Explore<CR>", opts)
mapKey("n", "<leader>q", ":bd<ESC>", opts)
mapKey("n", "<leader><S-q>", ":bd!<ESC>", opts)
mapKey("n", "<leader>l", "<C-w>l", opts)
mapKey("n", "<leader>h", "<C-w>h", opts)
mapKey("n", "<leader>j", "<C-w>j", opts)
mapKey("n", "<leader>k", "<C-w>k", opts)

-- duplicate line
mapKey("n", "<C-S-d>", "yyp", opts)
mapKey("v", "<C-S-d>", "yP", opts)
mapKey("i", "<C-S-d>", "<ESC>yyp", opts)

-- move lines up/down
mapKey("n", "<C-S-k>", ":m -2<CR>", opts)
mapKey("n", "<C-S-Up>", ":m -2<CR>", opts)
mapKey("n", "<C-S-j>", ":m +1<CR>", opts)
mapKey("n", "<C-S-Down>", ":m +1<CR>", opts)

mapKey("v", "<C-S-k>", ":m '<-2<CR>gv=gv", opts)
mapKey("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", opts)
mapKey("v", "<C-S-j>", ":m '>+1<CR>gv=gv", opts)
mapKey("v", "<C-S-Down>", ":m '>+1<CR>gv=gv", opts)

mapKey("i", "<C-S-k>", "<ESC>:m -2<CR>a", opts)
mapKey("i", "<C-S-Up>", "<ESC>:m -2<CR>a", opts)
mapKey("i", "<C-S-Down>", "<ESC>:m +1<CR>a", opts)
mapKey("i", "<C-S-j>", "<ESC>:m +1<CR>a", opts)

-- go to normal mode with jj
mapKey("i", "jj", "<ESC>", opts)

-- copy/paste
mapKey("n", "<C-c>", "yy", opts)
mapKey("v", "<C-c>", "y", opts)
mapKey("n", "<C-v>", "\"*p", opts)
mapKey("v", "<C-v>", "\"*p", opts)
mapKey("i", "<C-v>", "<ESC>\"*pa", opts)

-- undo/redo
mapKey("n", "<C-z>", "u", opts)
mapKey("n", "<C-S-z>", "<C-r>", opts)
mapKey("v", "<C-z>", "<ESC>u", opts)
mapKey("v", "<C-S-z>", "<ESC><C-r>", opts)
mapKey("i", "<C-z>", "<ESC>ua", opts)
mapKey("i", "<C-S-z>", "<ESC><C-r>a", opts)

-- substitute shorthand
mapKey("n", "<A-d>", "yiw:%s/<C-r>\"/", { noremap = true }) 
mapKey("v", "<C-d>", "y:%s/<C-r>\"/", { noremap = true })
mapKey("i", "<C-d>", "<ESC>yiw:%s/<C-r>\"/", { noremap = true })

-- indenting
mapKey("n", "<Tab>", ">>", opts)
mapKey("n", "<S-Tab>", "<<", opts)
mapKey("v", "<Tab>", ">gv", opts)
mapKey("v", "<S-Tab>", "<gv", opts)

-- Find files using Telescope command-line sugar.
mapKey("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
mapKey("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", opts)
mapKey("n", "<C-S-b>", "<cmd>Telescope buffers<cr>", opts)
mapKey("n", "<C-S-h>", "<cmd>Telescope help_tags<cr>", opts)
