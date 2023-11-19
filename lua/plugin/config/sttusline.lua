return function()
  local sttsln = require("sttusline")
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
      "%=",
      "copilot",
      "indent",
      -- "encoding",
      "pos-cursor",
      -- "pos-cursor-progress",
      "mode",
    },
  }
  sttsln.setup(opts)
end
