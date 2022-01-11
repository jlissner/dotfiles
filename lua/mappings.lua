local opts = { noremap = true, silent = true }

function mapKey(mode, lhs, rhs, opts) 
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function nnoremap(lhs, rhs, opts) mapKey("n", lhs, rhs, opts) end
function vnoremap(lhs, rhs, opts) mapKey("v", lhs, rhs, opts) end
function inoremap(lhs, rhs, opts) mapKey("i", lhs, rhs, opts) end

-- refresh settings
mapKey("n", "<F5>", ":source ~/AppData/Local/nvim/init.lua<CR>",  { noremap = true })
mapKey("n", "<S-F5>", ":e ~/AppData/Local/nvim<CR>",  { noremap = true })

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
mapKey("n", "<leader>v", "<C-w>v<C-w>l:Startify<CR>", opts)
mapKey("n", "<leader>s", "<C-w>s<C-w>j:Startify<CR>", opts)
mapKey("n", "<leader>l", "<C-w>l", opts)
mapKey("n", "<leader>h", "<C-w>h", opts)
mapKey("n", "<leader>j", "<C-w>j", opts)
mapKey("n", "<leader>k", "<C-w>k", opts)
mapKey("n", "<leader>,", "<C-w><", opts) -- make vertical pane bigger
mapKey("n", "<leader>.", "<C-w>>", opts) -- make vertical pane smaller

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

-- go into visual block mode needed to be remapped
mapKey("n", "<leader>x", "<C-v>", opts)

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
mapKey("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
mapKey("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
mapKey("n", "<C-S-f>", "<cmd>Telescope live_grep<CR>", opts)
mapKey("n", "<C-S-b>", "<cmd>Telescope buffers<CR>", opts)
mapKey("n", "<C-S-h>", "<cmd>Telescope help_tags<CR>", opts)
mapKey("n", "gtm", "<cmd>Telescope marks<CR>", opts)
mapKey("n", "gtb", "<cmd>Telescope buffers<CR>", opts)

-- folding
mapKey("n", "zc", "v}kzf", opts);

-- select all
mapKey("n", "<C-a>", "ggVG", opts);
mapKey("v", "<C-a>", "<ESC>ggVG", opts);
mapKey("i", "<C-a>", "<ESC>ggVG", opts);

-- barbar
-- Move to previous/next
mapKey("n", "<A-,>", ":BufferPrevious<CR>", opts);
mapKey("n", "<A-.>", ":BufferNext<CR>", opts);
-- Goto buffer in position...
mapKey("n", "<A-1>", ":BufferGoto 1<CR>", opts);
mapKey("n", "<A-2>", ":BufferGoto 2<CR>", opts);
mapKey("n", "<A-3>", ":BufferGoto 3<CR>", opts);
mapKey("n", "<A-4>", ":BufferGoto 4<CR>", opts);
mapKey("n", "<A-5>", ":BufferGoto 5<CR>", opts);
mapKey("n", "<A-6>", ":BufferGoto 6<CR>", opts);
mapKey("n", "<A-7>", ":BufferGoto 7<CR>", opts);
mapKey("n", "<A-8>", ":BufferGoto 8<CR>", opts);
mapKey("n", "<A-9>", ":BufferLast<CR>", opts);

mapKey("n", "<leader>q", ":BufferClose<CR>", opts);
mapKey("n", "<leader>Q", ":q<CR>", opts);
--[[ " Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR> ]]
