local default = "habamax"
local colorscheme = "vitesseo"
local is_available = require("utils.functions").is_available

local selected_colorscheme = is_available(colorscheme) and colorscheme or default

local ok, cllbck = pcall(require,"plugin.config." .. selected_colorscheme )

if ok then
  cllbck()
end

vim.cmd.colorscheme(selected_colorscheme)
