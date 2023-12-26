return function()
  require("luasnip.loaders.from_vscode").lazy_load()
  local util = require("luasnip.util.util")
  local types = require("luasnip.util.types")
  local node_util = require("luasnip.nodes.util")
  local ls = require("luasnip")

  ls.setup({
    parser_nested_assembler = function(_, snippetNode)
      local select = function(snip, no_move, dry_run)
        if dry_run then
          return
        end
        snip:focus()
        -- make sure the inner nodes will all shift to one side when the
        -- entire text is replaced.
        snip:subtree_set_rgrav(true)
        -- fix own extmark-gravities, subtree_set_rgrav affects them as well.
        snip.mark:set_rgravs(false, true)

        -- SELECT all text inside the snippet.
        if not no_move then
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
          node_util.select_node(snip)
        end
      end

      local original_extmarks_valid = snippetNode.extmarks_valid
      function snippetNode:extmarks_valid()
        -- the contents of this snippetNode are supposed to be deleted, and
        -- we don't want the snippet to be considered invalid because of
        -- that -> always return true.
        return true
      end

      function snippetNode:init_dry_run_active(dry_run)
        if dry_run and dry_run.active[self] == nil then
          dry_run.active[self] = self.active
        end
      end

      function snippetNode:is_active(dry_run)
        return (not dry_run and self.active) or (dry_run and dry_run.active[self])
      end

      function snippetNode:jump_into(dir, no_move, dry_run)
        self:init_dry_run_active(dry_run)
        if self:is_active(dry_run) then
          -- inside snippet, but not selected.
          if dir == 1 then
            self:input_leave(no_move, dry_run)
            return self.next:jump_into(dir, no_move, dry_run)
          else
            select(self, no_move, dry_run)
            return self
          end
        else
          -- jumping in from outside snippet.
          self:input_enter(no_move, dry_run)
          if dir == 1 then
            select(self, no_move, dry_run)
            return self
          else
            return self.inner_last:jump_into(dir, no_move, dry_run)
          end
        end
      end

      -- this is called only if the snippet is currently selected.
      function snippetNode:jump_from(dir, no_move, dry_run)
        if dir == 1 then
          if original_extmarks_valid(snippetNode) then
            return self.inner_first:jump_into(dir, no_move, dry_run)
          else
            return self.next:jump_into(dir, no_move, dry_run)
          end
        else
          self:input_leave(no_move, dry_run)
          return self.prev:jump_into(dir, no_move, dry_run)
        end
      end

      return snippetNode
    end,
  })

  --   local has_words_before = function()
  --     unpack = unpack or table.unpack
  --     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --   end

  --   vim.keymap.set({"i", "s"}, "<C-j>", function()
  --     if ls.expand_or_jumpable() then
  --       ls.expand_or_jump()
  --       return ""
  --     end
  --     return "<C-j>"
  --   end, {expr = true})

  --   vim.keymap.set({"i", "s"}, "<C-k>", function()
  --     if ls.jumpable(-1) then
  --       ls.jump(-1)
  --       return ""
  --     end
  --     return "<C-j>"
  --   end, {expr = true})

  ls.config.setup({
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "●", "Constant" } },
        },
      },
      [types.insertNode] = {
        active = {
          virt_text = { { "●", "Operator" } },
        },
      },
    },
  })

  vim.keymap.set({ "i" }, "<C-K>", function()
    ls.expand()
  end, { silent = true })
  vim.keymap.set({ "i", "s" }, "<C-L>", function()
    ls.jump(1)
  end, { silent = true })
  vim.keymap.set({ "i", "s" }, "<C-J>", function()
    ls.jump(-1)
  end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, { silent = true })

end
