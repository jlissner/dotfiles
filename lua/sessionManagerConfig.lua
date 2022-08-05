local mapKey = require('utils').mapKey;
local mapKeyOpts = require('utils').mapKeyOpts;

require('session_manager').setup({
  autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
});

mapKey('n', '<leader>ss', '<cmd>SessionManager save_current_session<CR>', mapKeyOpts);
mapKey('n', '<leader>sl', '<cmd>SessionManager load_session<CR>', mapKeyOpts);
mapKey('n', '<leader>sd', '<cmd>SessionManager delete_session<CR>', mapKeyOpts);

vim.api.nvim_create_autocmd({ 'SessionLoadPost' }, {
  group = config_group,
  callback = function()
    vim.cmd('NeoTreeShow')
  end,
})
