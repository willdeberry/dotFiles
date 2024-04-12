return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            bash = { 'shellcheck' },
            sh = { 'shellcheck' },
            python = { 'pylint' },
            yaml = { 'yamllint' },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
            group = lint_augroup,
            callback = function()
                require("lint").try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>ml", function()
            require("lint").try_lint()
        end, { desc = "Lint file" })
    end,
}
