return function()
  local sttsln = require("sttusline")

  -- local cDatetime = require("plugin.config.sttusline.components.datetime")
  -- local cLspstatus = require("plugin.config.sttusline.components.lspstatus")

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
      -- cLspstatus,
      "%=",
      "copilot",
      {
        -- new component
        name = "codium",
        update_group = "_codium_group",
        event = {}, -- The component will be update when the event is triggered
        user_event = { "VeryLazy", "InsertEnter" },
        timing = true, -- The component will be update every time interval
        lazy = true,
        space = {
          get_text = function()
            local load, result = pcall(function(p)
              return vim.fn["codeium#Enabled"]()
            end, {})
            if not load then
        return "-"
            end
            local status = vim.fn["codeium#GetStatusString"]()
            return status
          end,
        },
        configs = {},
        padding = { left = 0, right = 1 }, -- { left = 1, right = 1 }
        colors = {
          { fg = "#ececec", bg = "#09b6a2", bold = true },
          { fg = "#53131E"}
        }, -- { fg = colors.black, bg = colors.white }
        update = function(configs, space)
          local gt = space.get_text()
          local str1, str2 = "",""
          if gt == "--" or gt == '' or gt == "OFF" then
            str1 = "OFF"
          else
            str2 = gt
          end
          
          return {str2, str1}
        end,
        condition = function(config, space)
          return true
        end,
        on_highlight = function(configs, space) end,
      },
      -- {
      --   name ="lazy_updates",
      --   event = {}, 
      --   user_event = { "VeryLazy"},
      --   timing = true, -- The component will be update every time interval
      --   lazy = true,
      --   configs = {
      --     icon = "󰏔"
      --   },
        
      -- },
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
