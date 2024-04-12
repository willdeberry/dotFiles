local builtin = require('telescope.builtin')

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }

    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    --vim.api.nvim_set_keymap('i', '<CR>', [[ pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" ]], { noremap = true, expr = true })
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('i', '<CR>', [[ pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" ]], { expr = true })

-- Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
