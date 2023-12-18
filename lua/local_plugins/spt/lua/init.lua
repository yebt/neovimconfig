local M = {}

M.actions = {}

-- callback (function)
-- conditional (function)
-- priority nil|(number)
-- once nil|(boolean)
-- opts nil|(table)
M.suscribeFn = function(callback, conditional, priority, once)
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
	table.sort(M.actions, function(a, b)
		return a.priority > b.priority
	end)
end

M.suscribeTable = function(tableS)
	local tableR = vim.tabl_extend("force", {
		conditional = false,
		priority = 0,
		once = false,
	}, tableS)
	M.suscribeFn(tableR.callback, tableR.conditional, tableR.priority, tableR.once)
	-- tableS.priority = tableS.priority or 0
	-- tableS.priority = tableS.priority or 0
end

M.setup = function(config)
	_G.SpSuscribeFn = M.suscribeFn

	local opts = { noremap = true, silent = true, expr = true }
	vim.keymap.set("i", "<tab>", function()
		for _, action in pairs(M.actions) do
			if action.caleld and action.once then
				break
			end
			local typeConditinal = type(action.conditional)
			if
				not (
					(typeConditinal == "function" and action.conditional())
					or (typeConditinal == "boolean" and action.conditional)
				)
			then
				break
			end
			return action.callback()
		end
		return "<tab>"
	end, opts)
end

return M
