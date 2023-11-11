local opt = vim.opt

local configs = {

  compatible = false,
  --
  --
  wrap = false,
  --
  showbreak = "↳",
  linebreak = true,
  breakindent = true,
  breakindentopt = "min:40,shift:0,sbr",
  --
  --
  copyindent = true,
  preserveindent = true,
  --
  expandtab = true,
  shiftwidth = 4,
  tabstop = 4,
  softtabstop = 4,
  smartindent = true,
  --
  cursorline = true,
  -- guicursor = "a:block",
  guicursor = "a:block-cursor",

  --
  concealcursor = "nc",
  conceallevel = 2,

  --
  number = true,
  relativenumber = true,

  --
  cmdheight = 2,
  --
  confirm = true,
  --
  clipboard = "unnamed",
  --
  viewoptions = "folds,cursor",
  --
  foldenable = true,
  foldlevelstart = 99,
  foldcolumn = "1",
  foldmethod = "indent",
  --
  signcolumn = "auto",
  --
  splitbelow = true,
  splitright = true,
  splitkeep = "screen",
  --
  completeopt = {
    "menu",
    "menuone",
    "noselect",
    "noinsert",
  },
  --
  -- pumheight = 10,
  --
  scrolloff = 1, --0
  sidescrolloff = 4, --0
  --
  inccommand = "split",
  --
  ignorecase = true,
  smartcase = true,
  incsearch = true,
  --
  --showmode=false,
  --
  background = "dark",
  termguicolors = true,
  --
  showtabline = 2,
  --
  laststatus = 3, -- use 1 on global
  --
  --icon = true,
  --itlte=true,
  --
  timeout = true,
  timeoutlen = 500, -- 1000
  updatetime = 300, --4000
  --
  --virtualedit = 'block',
  --
  undofile = true,
  backup = true,
  backupdir = {
    --vim.fn.expand("$XDG_STATE_HOME/nvim/backup//"),
    vim.fn.stdpath("state") .. "/backup",
  },
  undodir = vim.fn.stdpath("state") .. "/undo",
  listchars = {
    tab = "▸ ",
    trail = "·",
    precedes = "«",
    extends = "»",
    space = "⋅",
    -- conceal
    nbsp = "+",
    eol = "↴",
  },
  fillchars = {
    diff = "╱",
    -- 
    -- 
    -- foldclose = "",
    -- foldopen = "",
    -- foldsep = "│"
    -- foldsep = "▏"
    -- diff = "",
  },
  diffopt = {
    "filler", -- sync text content
    -- "horizontal", -- use horizontal views -
    "closeoff", -- off diff on just 1 window
    --"followwrap",
    -- "internal",
    "linematch:60", --
    --  myers      the default algorithm
    -- minimal    spend extra time to generate the
    -- smallest possible diff
    -- patience   patience diff algorithm
    -- histogram  histogram diff algorithm
    -- "algorithm:histogram"
  },
  -- aABceFs_
  cpoptions = {
    a = true, -- When included, a ":read" command with a file name argument will set the alternate file name for the current window.
    b = true, -- When included, a ":write" command with a file name argument will set the alternate file name for the current window.
    B = true, -- A backslash has no special meaning in mappings, abbreviations, user commands and the "to" part of the menu commands.  Remove this flag to be able to use a backslash like a CTRL-V.  For example, the command
    --		   ":map X \<Esc>" results in X being mapped to:
    --		   'B' included:	"\^["	 (^[ is a real <Esc>)
    --		   'B' excluded:	"<Esc>"  (5 characters)
    c = true, -- Searching continues at the end of any match at the cursor position, but not further than the start of the next line.  When not present searching continues one character from the cursor position.  With 'c' "abababababab" only gets three matches when repeating "/abab", without 'c' there are five matches.
    e = true, -- When executing a register with ":@r", always add a <CR> to the last line, also when the register is not linewise.  If this flag is not present, the register is not linewise and the last line does not end in a <CR>, then the last line is put on the command-line and can be edited before hitting <CR>.
    F = true, -- When included, a ":write" command with a file name argument will set the file name for the current buffer, if the current buffer doesn't have a file name yet.  Also see |cpo-P|.
    n = true, -- When included, the column used for 'number' and 'relativenumber' will also be used for text of wrapped lines.
    s = true, -- Set buffer options when entering the buffer for the first time.  This is like it is in Vim version 3.0. And it is the default.  If not present the options are set when the buffer is created.
    ["_"] = true, -- When using |cw| on a word, do not include the whitespace following the word in the motion.
  },
  -- filnxtToOF
  shortmess = {
    f = true, -- use "(3 of 5)" instead of "(file 3 of 5)"		*shm-f*
    i = true, -- use "[noeol]" instead of "[Incomplete last line]"	*shm-i*
    l = true, -- use "999L, 888B" instead of "999 lines, 888 bytes"	*shm-l*
    n = true, -- use "[New]" instead of "[New File]"			*shm-n*
    x = true, -- use "[dos]" instead of "[dos format]", "[unix]"	instead of "[unix format]" and "[mac]" instead of "[macformat]" *shm-x*
    t = true, -- truncate file message at the start if it is too long	to fit on the command-line, "<" will appear in the left most column; ignored in Ex mode *shm-t*
    T = true, -- truncate other messages in the middle if they are too 	long to fit on the command line; "..." will appear in the middle; ignored in Ex mode *shm-T*
    o = true, -- overwrite message for writing a file with subsequent message for reading a file (useful for ":wn" or when 'autowrite' on) O	message for reading a file overwri
    O = true, -- message for reading a file overwrites any previous	message;  also for quickfix message (e.g., ":cn")
    F = true, -- don't give the file info when editing a file, like	`:silent` was used for the command
    --
    a = true, -- all short
    -- I = true -- hiddetn intro messages
  },

  --
  spelllang = "es,en",
  --
  sessionoptions = "buffers,curdir,winsize",
  --
}

local globals = {
  spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell",
  --
  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
  --
  netrw_browse_split = 4,
  netrw_banner = 0,
  netrw_use_errorwindow = 0,
  netrw_windize = 35,
  netrw_keepdir = 0,
}

----------------------------------
for key, valor in pairs(configs) do
  vim.opt[key] = valor
  vim.g.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell"
end

for key, valor in pairs(globals) do
  vim.g[key] = valor
end
