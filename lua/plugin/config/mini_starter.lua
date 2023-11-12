return function()
  -- require('mini.starter').setup({
  --   -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
  --   -- started with intent to show something else.
  --   autoopen = true,

  --   -- Whether to evaluate action of single active item
  --   evaluate_single = false,

  --   -- Items to be displayed. Should be an array with the following elements:
  --   -- - Item: table with <action>, <name>, and <section> keys.
  --   -- - Function: should return one of these three categories.
  --   -- - Array: elements of these three types (i.e. item, array, function).
  --   -- If `nil` (default), default items will be used (see |mini.starter|).
  --   items = nil,

  --   -- Header to be displayed before items. Converted to single string via
  --   -- `tostring` (use `\n` to display several lines). If function, it is
  --   -- evaluated first. If `nil` (default), polite greeting will be used.
  --   header = nil,

  --   -- Footer to be displayed after items. Converted to single string via
  --   -- `tostring` (use `\n` to display several lines). If function, it is
  --   -- evaluated first. If `nil` (default), default usage help will be shown.
  --   footer = nil,

  --   -- Array  of functions to be applied consecutively to initial content.
  --   -- Each function should take and return content for 'Starter' buffer (see
  --   -- |mini.starter| and |MiniStarter.content| for more details).
  --   content_hooks = nil,

  --   -- Characters to update query. Each character will have special buffer
  --   -- mapping overriding your global ones. Be careful to not add `:` as it
  --   -- allows you to go into command mode.
  --   query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',

  --   -- Whether to disable showing non-error feedback
  --   silent = false,

  -- })
  --

  
  local starter = require('mini.starter')
  -- Configuration similar to 'mhinz/vim-startify':

  starter.setup({
    evaluate_single = true,
    items = {
      starter.sections.builtin_actions(),
      starter.sections.recent_files(10, false),
      starter.sections.recent_files(10, true),
      -- Use this if you set up 'mini.sessions'
      starter.sections.sessions(5, true)
    },
    content_hooks = {
      starter.gen_hook.adding_bullet(),
      starter.gen_hook.indexing('all', { 'Builtin actions' }),
      starter.gen_hook.padding(3, 2),
    },
  })

  -- Configuration similar to 'glepnir/dashboard-nvim':

  -- starter.setup({
  --   items = {
  --     starter.sections.telescope(),
  --   },
  --   content_hooks = {
  --     starter.gen_hook.adding_bullet(),
  --     starter.gen_hook.aligning('center', 'center'),
  --   },
  -- })

  --
    -- local my_items = {
    -- { name = 'Echo random number', action = 'lua print(math.random())', section = 'Section 1' },
    -- function()
    --   return {
    --     { name = 'Item #1 from function', action = [[echo 'Item #1']], section = 'From function' },
    --     { name = 'Placeholder (always inactive) item', action = '', section = 'From function' },
    --     function()
    --       return {
    --         name = 'Item #1 from double function',
    --         action = [[echo 'Double function']],
    --         section = 'From double function',
    --       }
    --     end,
    --   }
    -- end,
    -- { name = [[Another item in 'Section 1']], action = 'lua print(math.random() + 10)', section = 'Section 1' },
  -- }

  -- local footer_n_seconds = (function()
    -- local timer = vim.loop.new_timer()
    -- local n_seconds = 0
    -- timer:start(0, 1000, vim.schedule_wrap(function()
    --   if vim.bo.filetype ~= 'starter' then
    --     timer:stop()
    --     return
    --   end
    --   n_seconds = n_seconds + 1
    --   MiniStarter.refresh()
    -- end))

    -- return function()
    --   return 'Number of seconds since opening: ' .. n_seconds
    -- end
  -- end)()

  -- local hook_top_pad_10 = function(content)
    -- -- Pad from top
    -- for _ = 1, 10 do
    --   -- Insert at start a line with single content unit
    --   table.insert(content, 1, { { type = 'empty', string = '' } })
    -- end
    -- return content
  -- end

  -- -- local starter = require('mini.starter')
  -- starter.setup({
    -- items = my_items,
    -- footer = footer_n_seconds,
    -- content_hooks = { hook_top_pad_10 },
  -- })
end
