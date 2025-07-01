local M = {}

M.defaults = {
	lsp = {
		enable = true,
		server = {
			cmd = { "pol", "lsp" },
			settings = {},
			on_attach = nil,
		},
	},
	auto_format = false,
}

M.opts = {}

function M.setup(opts)
	M.opts = vim.tbl_deep_extend("force", M.defaults, opts or {})
	return M.opts
end

function M.get()
	return M.opts
end

return M
