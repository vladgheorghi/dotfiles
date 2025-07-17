return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "python", "c", "lua", "rust", "vim", "vimdoc",
        "query", "markdown", "markdown_inline", "json",
        "yaml", "html", "css", "bash", "dockerfile",
        "cpp", "toml", "java", "javascript", "typescript",
        "regex", "go"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}

