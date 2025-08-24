return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(_, bufnr)
      local opts = { buffer = bufnr, silent = true }
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

      -- show diagnostics float automatically on hover
      local timer = vim.loop.new_timer()
      local delay = 200  -- milliseconds
    
      vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = bufnr,
        callback = function()
        -- stop any existing timer
        timer:stop()

        -- start a new timer
        timer:start(delay, 0, vim.schedule_wrap(function()
            -- check if a float is already open
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local config = vim.api.nvim_win_get_config(win)
                if config.relative ~= "" then
                    return  -- a float exists, don't open another
                end
            end

            -- open diagnostic float if there are diagnostics under the cursor
            local line = vim.api.nvim_win_get_cursor(0)[1] - 1
            local diagnostics = vim.diagnostic.get(0, { lnum = line })
            if #diagnostics > 0 then
                vim.diagnostic.open_float(nil, { focus = false })
            end
        end))
      end,})
      
      -- close floating window
      vim.keymap.set("n", "<Esc>", function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local config = vim.api.nvim_win_get_config(win)
            if config.relative ~= "" then
                vim.api.nvim_win_close(win, false)
            end
        end
      end, { silent = true })
  end

    -- new Neovim API: configure each server
    vim.lsp.config("pyright", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd", "rust_analyzer" },
      automatic_installation = true,
    })
  end,
}

