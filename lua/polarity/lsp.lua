local M = {}

function M.setup(opts)
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	if pcall(require, "cmp_nvim_lsp") then
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
	elseif pcall(require, "blink.cmp") then
		capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))
	end

	configs.polarity = {
		default_config = {
			filetypes = { "polarity" },
			capabilities = capabilities,
		}
	}

	vim.lsp.config("polarity", opts.server)
end

return M
