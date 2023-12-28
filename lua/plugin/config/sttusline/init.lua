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
      -- {
      --   "filename",
      --   {
      --     configs = {
      --       path=3
      --     }
      --   }
      -- },
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
            local load, _ = pcall(function()
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
          { fg = "#53131E" },
        }, -- { fg = colors.black, bg = colors.white }
        update = function(configs, space)
          local gt = space.get_text()
          local str1, str2 = "", ""
          if gt == "--" or gt == "" or gt == "OFF" then
            str1 = "OFF"
          else
            str2 = gt
          end

          return { str2, str1 }
        end,
        condition = function(config, space)
          return true
        end,
        on_highlight = function(configs, space) end,
      },
      {
        name = "lazy_updates",
        event = {},
        user_event = { "VeryLazy" },
        timing = true, -- The component will be update every time interval
        lazy = true,
        configs = {},
        update = function(configs, space)
          local ok, lst = pcall(require, "lazy.status")
          if not ok or not (lst.has_updates()) then
            return ""
          end
          return " " .. require("lazy.status").updates()
        end,
      },
      {
        "indent",
        -- {
        --   update = function()
        --     local usage = vim.api.nvim_buf_get_option(0, 'expandtab') and 'SPC' or 'TAB'
        --     -- return "Tab: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. "" end,
        --     return usage .. ":" .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. "" end,
        -- }
      },
      -- "encoding",
      "pos-cursor",
      -- "pos-cursor-progress",
      {
        "mode",
        {
          configs = {
            modes = {
              ["n"] = { "N", "STTUSLINE_NORMAL_MODE" },
              ["no"] = { "N (no)", "STTUSLINE_NORMAL_MODE" },
              ["nov"] = { "N (nov)", "STTUSLINE_NORMAL_MODE" },
              ["noV"] = { "N (noV)", "STTUSLINE_NORMAL_MODE" },
              ["noCTRL-V"] = { "N", "STTUSLINE_NORMAL_MODE" },
              ["niI"] = { "N i", "STTUSLINE_NORMAL_MODE" },
              ["niR"] = { "N r", "STTUSLINE_NORMAL_MODE" },
              ["niV"] = { "N v", "STTUSLINE_NORMAL_MODE" },

              ["nt"] = { "T", "STTUSLINE_NTERMINAL_MODE" },
              ["ntT"] = { "T (ntT)", "STTUSLINE_NTERMINAL_MODE" },

              ["v"] = { "V", "STTUSLINE_VISUAL_MODE" },
              ["vs"] = { "VC (Ctrl O)", "STTUSLINE_VISUAL_MODE" },
              ["V"] = { "VL", "STTUSLINE_VISUAL_MODE" },
              ["Vs"] = { "VL", "STTUSLINE_VISUAL_MODE" },
              [""] = { "VB", "STTUSLINE_VISUAL_MODE" },

              ["i"] = { "I", "STTUSLINE_INSERT_MODE" },
              ["ic"] = { "I (cmp)", "STTUSLINE_INSERT_MODE" },
              ["ix"] = { "I cmp", "STTUSLINE_INSERT_MODE" },

              ["t"] = { "T", "STTUSLINE_TERMINAL_MODE" },
              ["!"] = { "SHELL", "STTUSLINE_TERMINAL_MODE" },

              ["R"] = { "R", "STTUSLINE_REPLACE_MODE" },
              ["Rc"] = { "R (Rc)", "STTUSLINE_REPLACE_MODE" },
              ["Rx"] = { "REPLACEa (Rx)", "STTUSLINE_REPLACE_MODE" },
              ["Rv"] = { "V-R", "STTUSLINE_REPLACE_MODE" },
              ["Rvc"] = { "V-R (Rvc)", "STTUSLINE_REPLACE_MODE" },
              ["Rvx"] = { "V-R (Rvx)", "STTUSLINE_REPLACE_MODE" },

              ["s"] = { "S", "STTUSLINE_SELECT_MODE" },
              ["S"] = { "S-L", "STTUSLINE_SELECT_MODE" },
              [""] = { "S-B", "STTUSLINE_SELECT_MODE" },

              ["c"] = { "C", "STTUSLINE_COMMAND_MODE" },
              ["cv"] = { "C", "STTUSLINE_COMMAND_MODE" },
              ["ce"] = { "C", "STTUSLINE_COMMAND_MODE" },

              ["r"] = { "PROMPT", "STTUSLINE_CONFIRM_MODE" },
              ["rm"] = { "MORE", "STTUSLINE_CONFIRM_MODE" },
              ["r?"] = { "CONFIRM", "STTUSLINE_CONFIRM_MODE" },
              ["x"] = { "CONFIRM", "STTUSLINE_CONFIRM_MODE" },
            },
          },
        },
      },
      -- Datetime
      -- cDatetime
    },
  }

  sttsln.setup(opts)
end
