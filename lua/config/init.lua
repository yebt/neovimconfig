vim.g.mapleader = ' '
-- fast require
local old_path = package.path
package.path = vim.fn.expand("~/.config/nvim/lua/config/") .. "?.lua;"

-- Load settigns
require("options")
require("aucmds")
require("cmds")
require("keybinds")
require("lsp")
require("status")
-- require("netrw") -- supressed
require("lazyinit")

-- restore path
package.path = old_path

-- Last event of lazy.nivm needed aditional event lo lazy all plugins
vim.api.nvim_create_autocmd({ "User" }, {
	pattern = { "VeryLazy" },
	callback = function(args)
		-- aditional filetype event on verylazy
		vim.api.nvim_exec_autocmds("FileType", {})

		-- require("config.status")

		-- Aditional requires
		--require("locals.statusline")

		-- vim.schedule(function()
		--   --require("locals.statusline")
		--   --vim.api.nvim_exec_autocmds('User', { pattern = 'PostVeryLazy' })
		-- end)
	end,
})
