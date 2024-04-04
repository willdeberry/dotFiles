-- UI
vim.opt.nu = true
vim.opt.mouse = ''
vim.opt.background = 'dark'
vim.opt.colorcolumn = '120'
vim.opt.cursorline = true
vim.opt.lazyredraw = true
vim.opt.showtabline = 2

-- Whitespace
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.autoindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Vim Native Autocomplete
vim.cmd([[ 
    highlight PmenuSel ctermbg=3 ctermfg=0
]])
vim.api.nvim_set_keymap('i', '<CR>', [[ pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" ]], { noremap = true, expr = true })
