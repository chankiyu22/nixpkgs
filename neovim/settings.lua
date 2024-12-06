-- line number
vim.opt.number = true

-- Tab size
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- indent-blankline
vim.opt.list = true
vim.opt.listchars = {
	lead = "⋅",
	trail = "⋅",
	space = "⋅",
	tab = ">-",
}

-- scroll
vim.opt.scrolloff = 5

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Lazy redraw
-- People say this will make nvim faster
vim.opt.lazyredraw = true

-- bracket
vim.opt.showmatch = true

-- Direct write to files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.hidden = true

-- Helpful column line
vim.wo.colorcolumn = "80,120"

-- require
require('plugins.autopairs')
require('plugins.cmp')
require('plugins.formatter')
require('plugins.gitsigns')
require('plugins.intentblankline')
require('plugins.lsp')
require('plugins.lualine')
require('plugins.mason')
require('plugins.nullls')
require('plugins.telescope')
require('plugins.tree')
require('plugins.treesitter')
require('plugins.treesittercontext')
require('plugins.tsautotag')
require('theme')
