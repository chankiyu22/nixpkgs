local lspconfig = require("lspconfig")

local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

local make_on_attach = function(options)
	local on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "g?", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "gf", vim.lsp.buf.format, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)

		local disable_formatting = options.disable_formatting or false
		if disable_formatting then
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end
	end
	return on_attach
end

-- angular
-- lspconfig["angularls"].setup({
-- 	on_attach = make_on_attach({}),
-- 	capabilities = capabilities,
-- })

-- nix
lspconfig["rnix"].setup({
	on_attach = make_on_attach({}),
})

-- tailwind
-- lspconfig["tailwindcss"].setup({
-- 	on_attach = make_on_attach({}),
-- })

-- typescript
lspconfig["ts_ls"].setup({
	on_attach = make_on_attach({
		disable_formatting = true,
	}),
})

-- golang
lspconfig["gopls"].setup({
	on_attach = make_on_attach({}),
})

vim.api.nvim_set_keymap("n", "<C-n>", ":CodeActionMenu<CR>", { noremap = true, silent = true })
vim.g.code_action_menu_show_details = false
