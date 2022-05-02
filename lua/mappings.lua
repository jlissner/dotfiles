local mapKey = require('utils').mapKey;
local mapKeyOpts = require('utils').mapKeyOpts;

print(mapKeyOpts);

-- refresh settings
mapKey("n", "<F5>", ":source<CR>",  { noremap = true })
mapKey("n", "<S-F5>", ":e ~/AppData/Local/nvim<CR>",  { noremap = true })

-- saves
mapKey("n", "<C-s>", ":w<CR>",  { noremap = true })
mapKey("v", "<C-s>", "<ESC>:w<CR>",  { noremap = true })
mapKey("i", "<C-s>", "<ESC>:w<CR>l",  { noremap = true })

-- clear highlight on escape
mapKey("n", "<ESC>", ":noh <CR>", mapKeyOpts)

-- commenting and uncommenting stuff
mapKey("n", "<C-/>", "mtgcc`t", { silent = true })
mapKey("v", "<C-/>", "gbgv", { silent = true })
mapKey("i", "<C-/>", "<ESC>mtgc`ta", { silent = true })

-- duplicate line
mapKey("n", "<C-S-d>", "yyp", mapKeyOpts)
mapKey("v", "<C-S-d>", "yP", mapKeyOpts)
mapKey("i", "<C-S-d>", "<ESC>yyp", mapKeyOpts)

-- move lines up/down
mapKey("n", "<C-S-k>", ":m -2<CR>", mapKeyOpts)
mapKey("n", "<C-S-Up>", ":m -2<CR>", mapKeyOpts)
mapKey("n", "<C-S-j>", ":m +1<CR>", mapKeyOpts)
mapKey("n", "<C-S-Down>", ":m +1<CR>", mapKeyOpts)

mapKey("v", "<C-S-k>", ":m '<-2<CR>gv=gv", mapKeyOpts)
mapKey("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", mapKeyOpts)
mapKey("v", "<C-S-j>", ":m '>+1<CR>gv=gv", mapKeyOpts)
mapKey("v", "<C-S-Down>", ":m '>+1<CR>gv=gv", mapKeyOpts)

mapKey("i", "<C-S-k>", "<ESC>:m -2<CR>a", mapKeyOpts)
mapKey("i", "<C-S-Up>", "<ESC>:m -2<CR>a", mapKeyOpts)
mapKey("i", "<C-S-Down>", "<ESC>:m +1<CR>a", mapKeyOpts)
mapKey("i", "<C-S-j>", "<ESC>:m +1<CR>a", mapKeyOpts)

-- copy/paste
mapKey("n", "Y", "yg$", mapKeyOpts) -- yank from cursor to end of line
mapKey("v", "p", '"_dP', mapKeyOpts) -- dont yant text after pasting in visual mode
mapKey("n", "<C-c>", "yy", mapKeyOpts)
mapKey("v", "<C-c>", "y", mapKeyOpts)
mapKey("v", "<C-v>", "\"*p", mapKeyOpts)
mapKey("i", "<C-v>", "<ESC>\"*pa", mapKeyOpts)

-- undo/redo
mapKey("n", "<C-z>", "u", mapKeyOpts)
mapKey("n", "<C-S-z>", "<C-r>", mapKeyOpts)
mapKey("v", "<C-z>", "<ESC>u", mapKeyOpts)
mapKey("v", "<C-S-z>", "<ESC><C-r>", mapKeyOpts)
mapKey("i", "<C-z>", "<ESC>ua", mapKeyOpts)
mapKey("i", "<C-S-z>", "<ESC><C-r>a", mapKeyOpts)

-- indenting
mapKey("n", ">", ">>", mapKeyOpts)
mapKey("n", "<", "<<", mapKeyOpts)
mapKey("v", ">", ">gv", mapKeyOpts)
mapKey("v", "<", "<gv", mapKeyOpts)

-- Find files using Telescope command-line sugar.
mapKey("n", "<C-p>", "<cmd>Telescope git_files<CR>", mapKeyOpts)
mapKey("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", mapKeyOpts)
mapKey("n", "<C-S-f>", "<cmd>Telescope live_grep<CR>", mapKeyOpts)
mapKey("n", "<C-S-b>", "<cmd>Telescope buffers<CR>", mapKeyOpts)
mapKey("n", "<C-S-h>", "<cmd>Telescope help_tags<CR>", mapKeyOpts)
mapKey("n", "gtm", "<cmd>Telescope marks<CR>", mapKeyOpts)
mapKey("n", "gtb", "<cmd>Telescope buffers<CR>", mapKeyOpts)

-- git signs
mapKey("n", "<leader>bl", ":Gitsigns blame_line<CR>", mapKeyOpts);
mapKey("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", mapKeyOpts);
mapKey("n", "<leader>hd", ":Gitsigns diffthis<CR>", mapKeyOpts);
mapKey("n", "<leader>hu", ":Gitsigns reset_hunk<CR>", mapKeyOpts);

-- folding
mapKey("n", "zc", "vaIzf", { silent = true });
mapKey("n", "<Tab>", "za", { silent = true });

-- buffers
mapKey("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", mapKeyOpts);
mapKey("n", "<leader>bN", "<cmd>BufferLineCyclePrev<CR>", mapKeyOpts);
mapKey("n", "<leader>bb", "<cmd>Telescope buffers<CR>", mapKeyOpts);
mapKey("n", "<leader>bp", "<cmd>BufferLinePick<CR>", mapKeyOpts);
mapKey("n", "<leader>x", "<cmd>BufDel<CR>", mapKeyOpts);
mapKey("n", "<leader>X", "<cmd>BufDel!<CR>", mapKeyOpts);
mapKey("n", "<leader>q", "<cmd>q<CR>", mapKeyOpts);
mapKey("n", "<leader>bd", "<cmd>%bd | e#<CR>", mapKeyOpts);

-- terminal commands
mapKey("n", "<leader>t", "<cmd>FloatermToggle<CR>", mapKeyOpts);
mapKey("t", "<ESC>", "<cmd>FloatermToggle<CR>", mapKeyOpts);
mapKey("t", "<C-w>", "<cmd>FloatermKill<CR>", mapKeyOpts);
mapKey("t", "<C-T>", "<cmd>FloatermNew<CR>", mapKeyOpts);
mapKey("t", "<Tab>", "<cmd>FloatermNext<CR>", mapKeyOpts);
mapKey("t", "<S-Tab>", "<cmd>FloatermPrev<CR>", mapKeyOpts);

-- nvim tree
mapKey("n", "<leader>nn", "<cmd>:NvimTreeToggle<CR>", mapKeyOpts);
mapKey("n", "-", "<cmd>:NvimTreeFindFile<CR>", mapKeyOpts);
mapKey("n", "<leader>nc", "<cmd>:NvimTreeCollapse<CR>", mapKeyOpts);
