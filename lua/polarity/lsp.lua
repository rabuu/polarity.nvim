local M = {}

function M.setup(opts)
	local lspconfig = require("lspconfig")
	local configs = require("lspconfig.configs")

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	if pcall(require, "cmp_nvim_lsp") then
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
	end

	configs.polarity = {
		default_config = {
			filetypes = { "polarity" },
			root_dir = function(fname)
				-- return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
				return vim.fn.getcwd()
			end,
			capabilities = capabilities,
		}
	}

	lspconfig.polarity.setup(opts.server)
end

return M
