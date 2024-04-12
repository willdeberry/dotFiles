return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local actions = require("telescope.actions")

        require('telescope').setup({
            pickers = {
                find_files = {
                    mappings = {
                        n = {
                            ["<CR>"] = actions.select_tab
                        },
                        i = {
                            ["<CR>"] = actions.select_tab
                        },
                    },
                },
            },
        })
    end
}
