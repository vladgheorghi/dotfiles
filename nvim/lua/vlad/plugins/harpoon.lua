return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        -- Import core modules from Harpoon 2
        local list = harpoon:list()

        -- Keybindings
        vim.keymap.set("n", "<leader>a", function() list:add() end, { desc = "Harpoon add file" })
        vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(list) end, { desc = "Harpoon menu" })

        -- Quick navigation
        vim.keymap.set("n", "<leader>1", function() list:select(1) end, { desc = "Harpoon 1" })
        vim.keymap.set("n", "<leader>2", function() list:select(2) end, { desc = "Harpoon 2" })
        vim.keymap.set("n", "<leader>3", function() list:select(3) end, { desc = "Harpoon 3" })
        vim.keymap.set("n", "<leader>4", function() list:select(4) end, { desc = "Harpoon 4" })
    end,
}

