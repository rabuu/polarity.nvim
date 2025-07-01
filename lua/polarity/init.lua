local M = {}

function M.setup(opts)
	opts = require("polarity.config").setup(opts)

	if opts.lsp and opts.lsp.enable then
		require("polarity.lsp").setup(opts.lsp)
	end

	require("polarity.autocommands").setup(opts)
end

return M
