# polarity.nvim
A simple Neovim plugin for the [Polarity](https://github.com/polarity-lang/polarity) language.

This plugin provides basic syntax highlighting and sets up the LSP server for Polarity source files.

## Installation
You need to have the `pol` binary available (or set a custom path in the plugin configuration).

Use your preferred plugin manager to install `"rabuu/polarity.nvim"`.

Here's an example for the [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager:
```lua
{
    "rabuu/polarity.nvim",
    ft = "polarity",
    dependencies = { "neovim/nvim-lspconfig" },

    -- This is the default configuration
    opts = {
        lsp = {
            enable = true,
            server = {
                cmd = { "pol", "lsp" },
                settings = {},
                on_attach = nil,
            },
        },
        auto_format = false,
    },
}
```
