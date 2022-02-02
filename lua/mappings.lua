local opts = { noremap = true, silent = true }

function mapKey(mode, lhs, rhs, opts) 
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function nnoremap(lhs, rhs, opts) mapKey("n", lhs, rhs, opts) end
function vnoremap(lhs, rhs, opts) mapKey("v", lhs, rhs, opts) end
function inoremap(lhs, rhs, opts) mapKey("i", lhs, rhs, opts) end

-- refresh settings
mapKey("n", "<F5>", ":source<CR>",  { noremap = true })
mapKey("n", "<S-F5>", ":e ~/AppData/Local/nvim<CR>",  { noremap = true })

-- saves
mapKey("n", "<C-s>", ":w<CR>",  { noremap = true })
mapKey("v", "<C-s>", "<ESC>:w<CR>",  { noremap = true })
mapKey("i", "<C-s>", "<ESC>:w<CR>l",  { noremap = true })

-- clear highlight on escape
mapKey("n", "<ESC>", ":noh <CR>", opts)

-- commenting and uncommenting stuff
mapKey("n", "<C-/>", "mtgcc`t", { silent = true })
mapKey("v", "<C-/>", "gbgv", { silent = true })
mapKey("i", "<C-/>", "<ESC>mtgc`ta", { silent = true })

-- window helpers
mapKey("n", "<leader>1", "1<C-w><C-w>", opts) -- go to window 1-10
mapKey("n", "<leader>2", "2<C-w><C-w>", opts)
mapKey("n", "<leader>3", "3<C-w><C-w>", opts)
mapKey("n", "<leader>4", "4<C-w><C-w>", opts)
mapKey("n", "<leader>5", "5<C-w><C-w>", opts)
mapKey("n", "<leader>6", "6<C-w><C-w>", opts)
mapKey("n", "<leader>7", "7<C-w><C-w>", opts)
mapKey("n", "<leader>8", "8<C-w><C-w>", opts)
mapKey("n", "<leader>9", "9<C-w><C-w>", opts)
mapKey("n", "<leader>0", "10<C-w><C-w>", opts)

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

-- copy/paste
mapKey("n", "Y", "yg$", opts) -- yank from cursor to end of line
mapKey("v", "p", '"_dP', opts) -- dont yant text after pasting in visual mode
mapKey("n", "<C-c>", "yy", opts)
mapKey("v", "<C-c>", "y", opts)
mapKey("n", "<C-v>", "\"*p", opts)
mapKey("v", "<C-v>", "\"*p", opts)
mapKey("i", "<C-v>", "<ESC>\"*pa", opts)

-- go into visual block mode needed to be remapped
mapKey("n", "<C-x>", "<C-v>", opts)

-- undo/redo
mapKey("n", "<C-z>", "u", opts)
mapKey("n", "<C-S-z>", "<C-r>", opts)
mapKey("v", "<C-z>", "<ESC>u", opts)
mapKey("v", "<C-S-z>", "<ESC><C-r>", opts)
mapKey("i", "<C-z>", "<ESC>ua", opts)
mapKey("i", "<C-S-z>", "<ESC><C-r>a", opts)

-- sidebar mappings
mapKey("n", "<leader>n", "<cmd>SidebarNvimToggle<CR>", opts);
mapKey("n", "<leader>e", "<cmd>SidebarNvimFocus<CR>", opts);

-- substitute shorthand
mapKey("n", "<A-d>", "<plug>(SubversiveSubstituteWordRange)", {});
mapKey("v", "<A-d>", "<plug>(SubversiveSubstituteRange)", {});

-- indenting
mapKey("v", "<Tab>", ">gv", opts)
mapKey("v", "<S-Tab>", "<gv", opts)

-- Find files using Telescope command-line sugar.
mapKey("n", "<C-p>", "<cmd>Telescope git_files<CR>", opts)
mapKey("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
mapKey("n", "<C-S-f>", "<cmd>Telescope live_grep<CR>", opts)
mapKey("n", "<C-S-b>", "<cmd>Telescope buffers<CR>", opts)
mapKey("n", "<C-S-h>", "<cmd>Telescope help_tags<CR>", opts)
mapKey("n", "gtm", "<cmd>Telescope marks<CR>", opts)
mapKey("n", "gtb", "<cmd>Telescope buffers<CR>", opts)

-- folding
mapKey("n", "zc", "vaIzf", { silent = true });

-- barbar
-- pick buffer
mapKey("n", "<leader>b", ":BufferPick<CR>", opts);

-- Move to previous/next
mapKey("n", "<S-Tab>", ":BufferPrevious<CR>", opts);
mapKey("n", "<Tab>", ":BufferNext<CR>", opts);

-- Toggle ZenMode
mapKey("n", "<leader>zm", "<cmd>ZenMode<CR>", opts);

-- Goto buffer in position...
mapKey("n", "<C-1>", ":BufferGoto 1<CR>", opts);
mapKey("n", "<C-2>", ":BufferGoto 2<CR>", opts);
mapKey("n", "<C-3>", ":BufferGoto 3<CR>", opts);
mapKey("n", "<C-4>", ":BufferGoto 4<CR>", opts);
mapKey("n", "<C-5>", ":BufferGoto 5<CR>", opts);
mapKey("n", "<C-6>", ":BufferGoto 6<CR>", opts);
mapKey("n", "<C-7>", ":BufferGoto 7<CR>", opts);
mapKey("n", "<C-8>", ":BufferGoto 8<CR>", opts);
mapKey("n", "<C-9>", ":BufferLast<CR>", opts);

mapKey("n", "<leader>x", ":BufferDelete<CR>", opts);
mapKey("n", "<leader>q", ":q<CR>", opts);

-- terminal commands
mapKey("n", "<leader>t", "<cmd>FloatermToggle<CR>", opts);
mapKey("t", "<ESC>", "<cmd>FloatermToggle<CR>", opts);
mapKey("t", "<C-w>", "<cmd>FloatermKill<CR>", opts);
mapKey("t", "<C-T>", "<cmd>FloatermNew<CR>", opts);
mapKey("t", "<Tab>", "<cmd>FloatermNext<CR>", opts);
mapKey("t", "<S-Tab>", "<cmd>FloatermPrev<CR>", opts);

-- custom motions
mapKey("o", "ie", "<cmd>exec \"normal! ggVG\"<CR>", opts);
mapKey("o", "iv", "<cmd>exec \"normal! HVL\"<CR>", opts);
