-- line number
vim.opt.number = true

-- Tab size
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- indent-blankline
require("indent_blankline").setup({
	show_current_context = true,
})
vim.opt.list = true
vim.opt.listchars = {
	lead = "⋅",
	trail = "⋅",
	space = "⋅",
	tab = ">-",
}

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


