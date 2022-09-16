local mapKey = require('utils').mapKey;
local mapKeyOpts = require('utils').mapKeyOpts;

-- clear highlight on escape
mapKey("n", "<ESC>", ":noh <CR>", mapKeyOpts)

-- commenting and uncommenting stuff
mapKey("n", "<C-/>", "mtgcc`t", { silent = true })
mapKey("v", "<C-/>", "gbgv", { silent = true })
mapKey("i", "<C-/>", "<ESC>mtgc`ta", { silent = true })

-- move lines up/down
mapKey("n", "<C-S-k>", ":m -2<CR>", mapKeyOpts)
mapKey("n", "<C-S-j>", ":m +1<CR>", mapKeyOpts)

mapKey("v", "<C-S-k>", ":m '<-2<CR>gv=gv", mapKeyOpts)
mapKey("v", "<C-S-j>", ":m '>+1<CR>gv=gv", mapKeyOpts)

mapKey("i", "<C-S-k>", "<ESC>:m -2<CR>a", mapKeyOpts)
mapKey("i", "<C-S-Down>", "<ESC>:m +1<CR>a", mapKeyOpts)

-- copy/paste
mapKey("n", "Y", "yg$", mapKeyOpts) -- yank from cursor to end of line
mapKey("v", "p", '"_dP', mapKeyOpts) -- dont yant text after pasting in visual mode
mapKey("i", "<C-v>", "<ESC>\"*pa", mapKeyOpts)

-- dubplicate lines
mapKey("n", "<C-S-d>", "yyp", mapKeyOpts);
mapKey("v", "<C-S-d>", "yPgv", mapKeyOpts);

-- undo/redo
mapKey("n", "<C-z>", "u", mapKeyOpts)
mapKey("n", "<C-S-z>", "<C-r>", mapKeyOpts)
mapKey("v", "<C-z>", "<ESC>u", mapKeyOpts)
mapKey("v", "<C-S-z>", "<ESC><C-r>", mapKeyOpts)
mapKey("i", "<C-z>", "<ESC>ua", mapKeyOpts)
mapKey("i", "<C-S-z>", "<ESC><C-r>a", mapKeyOpts)

-- indenting
mapKey("v", ">", ">gv", mapKeyOpts)
mapKey("v", "<", "<gv", mapKeyOpts)

-- Find files using Telescope command-line sugar.
mapKey("n", "<C-p>", "<cmd>Telescope git_files<CR>", mapKeyOpts)
mapKey("n", "<C-f>", "/", mapKeyOpts)
mapKey("n", "<C-S-f>", "<cmd>Telescope live_grep<CR>", mapKeyOpts)
mapKey("n", "<leader>r", "<cmd>Telescope oldfiles<CR>", mapKeyOpts)

-- git signs
mapKey("n", "<leader>hb", ":Gitsigns blame_line<CR>", mapKeyOpts);
mapKey("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", mapKeyOpts);
mapKey("n", "<leader>hd", ":Gitsigns diffthis<CR>", mapKeyOpts);
mapKey("n", "<leader>hu", ":Gitsigns reset_hunk<CR>", mapKeyOpts);
mapKey("n", "[h", ":Gitsigns next_hunk<CR>", mapKeyOpts);
mapKey("n", "]h", ":Gitsigns prev_hunk<CR>", mapKeyOpts);

-- terminal commands
mapKey("n", "<leader>t", "<cmd>FloatermToggle<CR>", mapKeyOpts);
mapKey("t", "<leader>t", "<cmd>FloatermToggle<CR>", mapKeyOpts);
mapKey("t", "<ESC>", "<cmd>FloatermToggle<CR>", mapKeyOpts);
mapKey("t", "<C-S-w>", "<cmd>FloatermKill<CR>", mapKeyOpts);
mapKey("t", "<C-T>", "<cmd>FloatermNew<CR>", mapKeyOpts);
mapKey("t", "<Tab>", "<cmd>FloatermNext<CR>", mapKeyOpts);
mapKey("t", "<S-Tab>", "<cmd>FloatermPrev<CR>", mapKeyOpts);

-- buffers & file nav
mapKey("n", "gn", "<cmd>BufferLineCycleNext<CR>", mapKeyOpts);
mapKey("n", "gN", "<cmd>BufferLineCyclePrev<CR>", mapKeyOpts);
mapKey("n", "<leader>bp", "<cmd>BufferLinePick<CR>", mapKeyOpts);
mapKey("n", "<leader>x", "<cmd>BufDel<CR>", mapKeyOpts);
mapKey("n", "<leader>q", "<cmd>q<CR>", mapKeyOpts);
mapKey("n", "<leader>bb", "<cmd>Telescope buffers<CR>", mapKeyOpts);

-- nvim tree
mapKey("n", "-", "<cmd>:NeoTreeFloat<CR>", mapKeyOpts);
mapKey("n", "<leader>nn", "<cmd>:NeoTreeShow<CR>", mapKeyOpts);
