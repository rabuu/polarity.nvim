local M = {}

function M.setup(opts)
	local group = vim.api.nvim_create_augroup("PolarityPlugin", { clear = true })

	-- Auto-format on save (if enabled)
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = group,
		pattern = "*.pol",
		callback = function() 
			if opts.auto_format then
				vim.lsp.buf.format({ async = false })
			end
		end,
	})

	-- Set up buffer-local settings for Polarity files
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "polarity",
		callback = function()
			-- Set up buffer-local options
			vim.opt_local.commentstring = "// %s"
			vim.opt_local.expandtab = true
			vim.opt_local.shiftwidth = 4
			vim.opt_local.tabstop = 4
		end,
	})
end

return M
