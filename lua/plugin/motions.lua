-- This contian the motions and searchers
return {

  -- fzf-lua
  {
    "ibhagwan/fzf-lua",
    dependencies = {
       "junegunn/fzf", build = "./install --bin" 
    },
    cmd ={
      "FzfLua"
    }
  },

  -- fzf vim
  -- {
  --   "junegunn/fzf.vim",
  --   dependencies = {
  --      "junegunn/fzf", build = "./install --bin" 
  --   },
  --   cmd = {
  --     "Files"
  --   }
  -- }
}
