return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>pf', desc = '[P]roject [F]iles' },
        { '<leader>ps', desc = '[P]roject [S]earch' },
        { '<C-p>',       desc = 'Git files' },
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup({
            defaults = {
                file_ignore_patterns = { 'node_modules', '.git/' },
            },
        })

        -- Find file in all files (hidden included)
        vim.keymap.set('n', '<leader>pf', function()
            builtin.find_files({ hidden = true, no_ignore = true })
        end)

        -- Find text in all files (hidden included)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({
                search = vim.fn.input("Grep > "),
                additional_args = function() return { "--hidden", "--no-ignore" } end,
            })
        end)

        -- Find file in git files (if inside repo)
        vim.keymap.set('n', '<C-p>', builtin.git_files)
    end,
}

