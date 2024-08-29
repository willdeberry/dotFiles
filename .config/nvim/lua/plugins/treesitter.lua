return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {
              "bash",
              "html",
              "gitignore",
              "javascript",
              "json",
              "lua",
              "markdown",
              "markdown_inline",
              "mermaid",
              "python",
              "rust",
              "toml",
              "vim",
              "vimdoc",
              "yaml"
          },
          sync_install = false,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
          },
          indent = { enable = true },
        })
    end
}
