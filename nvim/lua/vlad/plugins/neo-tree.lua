return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- for file icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        filtered_items = {
          visible = true, -- show dotfiles
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        hijack_netrw_behavior = "open_current",
        follow_current_file = {
          enabled = true, -- sync with current buffer
        },
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        indent = {
          padding = 1,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<cr>"] = "open",
          ["P"] = { "toggle_preview", config = { use_float = false } }, -- preview in split
        },
      },
    })

    -- Toggle with <leader>e
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree file explorer" })

  end,
  lazy = false,
}

