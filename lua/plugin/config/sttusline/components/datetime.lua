-- Change NewComponent to your component name
local NewComponent = require("sttusline.component").new()

-- The component will be update when the event is triggered
-- To disable default event, set NewComponent.set_event = {}
NewComponent.set_event({})

-- The component will be update when the user event is triggered
-- To disable default user_event, set NewComponent.set_user_event = {}
NewComponent.set_user_event({ "VeryLazy" })

-- The component will be update every time interval
NewComponent.set_timing(true)

-- The component will be update when the require("sttusline").setup() is called
NewComponent.set_lazy(true)

-- The config of the component
-- After set_config, the config will be available in the component
-- You can access the config by NewComponent.get_config()
NewComponent.set_config({
	style = "default",
})

-- The number of spaces to add before and after the component
NewComponent.set_padding(1)
-- or NewComponent.set_padding{ left = 1, right = 1 }

-- The colors of the component. Rely on the return value of the update function, you have 3 ways to set the colors
-- If the return value is string
-- NewComponent.set_colors { fg = colors.set_black, bg = colors.set_white }
-- If the return value is table of string
-- NewComponent.set_colors { { fg = "#009900", bg = "#ffffff" }, { fg = "#000000", bg = "#ffffff" }}
-- -- so if the return value is { "string1", "string2" }
-- -- then the string1 will be highlight with { fg = "#009900", bg = "#ffffff" }
-- -- and the string2 will be highlight with { fg = "#000000", bg = "#ffffff" }
--
-- -- if you don't want to add highlight for the string1 now
-- -- because it will auto update new colors when the returning value in update function is a table that contains the color options,
-- -- you can add a empty table in the first element
-- -- {
--     colors = {
--         {},
--         { fg = "#000000", bg = "#ffffff" }
--     },
-- -- }
--
-- NOTE: The colors options can be the colors name or the colors options
-- colors = {
--     { fg = "#009900", bg = "#ffffff" },
--     "DiagnosticsSignError",
-- },
--
-- -- So if the return value is { "string1", "string2" }
-- -- then the string1 will be highlight with { fg = "#009900", bg = "#ffffff" }
-- -- and the string2 will be highlight with the colors options of the DiagnosticsSignError highlight
--
-- -- Or you can set the fg(bg) follow the colors options of the DiagnosticsSignError highlight
-- {
--     colors = {
--         { fg = "DiagnosticsSignError", bg = "#ffffff" },
--         "DiagnosticsSignError",
--     },
-- }

NewComponent.set_colors({}) -- { fg = colors.set_black, bg = colors.set_white }

-- The function will return the value of the component to display on the statusline(required).
-- Must return a string or a table of string or a table of  { "string", { fg = "color", bg = "color" } }
-- NewComponent.set_update(function() return { "string1", "string2" } end)
-- NewComponent.set_update(function() return { { "string1", {fg = "#000000", bg ="#fdfdfd"} },  "string3", "string4" } end)
NewComponent.set_update(function()
	local style = NewComponent.get_config().style
	local fmt = style
	if style == "default" then
		fmt = "%A, %B %d | %H.%M"
	elseif style == "us" then
		fmt = "%m/%d/%Y"
	elseif style == "uk" then
		fmt = "%d/%m/%Y"
	elseif style == "iso" then
		fmt = "%Y-%m-%d"
	end
	return os.date(fmt) .. ""
end)

-- The function will call when the component is highlight
NewComponent.set_onhighlight(function() end)

-- The function will return the condition to display the component when the component is update
-- Must return a boolean
NewComponent.set_condition(function()
	return true
end)

-- The function will call on the first time component load
NewComponent.set_onload(function() end)

return NewComponent
