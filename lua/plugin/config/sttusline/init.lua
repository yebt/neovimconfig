return function()
	local sttsln = require("sttusline")

	-- local cDatetime = require("plugin.config.sttusline.components.datetime")
	local cLspstatus = require("plugin.config.sttusline.components.lspstatus")

	-- local Datetime = require("sttusline.component").new()
	-- Datetime.set_config {
	--   style = "default",
	-- }
	-- Datetime.set_timing(true)
	-- Datetime.set_update(function()
	--   local style = Datetime.get_config().style
	--   local fmt = style
	--   if style == "default" then
	--     fmt = "%A, %B %d | %H.%M"
	--   elseif style == "us" then
	--     fmt = "%m/%d/%Y"
	--   elseif style == "uk" then
	--     fmt = "%d/%m/%Y"
	--   elseif style == "iso" then
	--     fmt = "%Y-%m-%d"
	--   end
	--   return os.date(fmt) .. ""
	-- end)

	local opts = {
		-- statusline_color = "#000000",
		statusline_color = "StatusLine",

		-- | 1 | 2 | 3
		-- recommended: 3
		laststatus = 3,
		disabled = {
			filetypes = {
				"NvimTree",
				"lazy",
			},
			buftypes = {
				"terminal",
			},
		},
		components = {
			"git-branch",
			"filename",
			"git-diff",
			"%=",
			"diagnostics",
			"lsps-formatters",
			cLspstatus,
			"%=",
			"copilot",
			"indent",
			-- "encoding",
			"pos-cursor",
			-- "pos-cursor-progress",
			"mode",
			-- Datetime
			-- cDatetime
		},
	}
	sttsln.setup(opts)
end
