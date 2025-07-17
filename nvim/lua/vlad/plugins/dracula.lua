return {
  "dracula/vim",
  name = "dracula",     -- So it loads as "dracula" instead of "vim"
  lazy = false,         -- Load it during startup
  priority = 1000,      -- Load before other plugins
  config = function()
    vim.cmd.colorscheme("dracula")
  end,
}

