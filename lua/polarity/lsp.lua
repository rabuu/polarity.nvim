local M = {}

function M.setup(opts)
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	if pcall(require, "cmp_nvim_lsp") then
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
	elseif pcall(require, "blink.cmp") then
		capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))
	end

	local default_config = {
		filetypes = { "polarity" },
		capabilities = capabilities,
	}

	local lsp_config = vim.tbl_deep_extend("force", default_config, opts.server)

	vim.lsp.config("polarity", lsp_config)
	vim.lsp.enable("polarity")
end

return M
