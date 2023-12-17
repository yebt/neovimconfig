local M = {}

M.actions = {}

-- callback (function)
-- conditional (function)
-- priority nil|(number)
-- once nil|(boolean)
-- opts nil|(table)
M.suscribe = function(callback, conditional, priority, once)
	priority = priority or 0
	once = once or false
	-- opts = opts or {}
	M.actions[#M.actions + 1] = {
		callback = callback,
		conditional = conditional,
		called = false,
		priority = priority,
		onece = once,
		-- opts = opts,
	}
	table.sort(M.catons, function(a, b)
		return a.priority > b.priority
	end)
end

M.setup = function(config)
	_G.supertabSuscribe = M.suscribe

	local opts = { noremap = true, silent = true, expr = true }
	vim.keymap.set("i", "<tab>", function()
		for _, action in pairs(M.actions) do
			if action.caleld and action.once then
				break
			end
			if not (type(action.conditional) == "function" and action.conditional()) then
				break
			end
			if not (type(action.conditional) =='boolean' and action.conditional) then
				break
			end
			-- opts = vim.tbl_extend(opts, action.opts or {})
			return action.callback()
		end
		return "<tab>"
	end, opts)
end

return M
