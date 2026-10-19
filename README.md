# Neovim config

Requires Neovim 0.12 or newer. Plugins are managed by `vim.pack` and pinned in
`nvim-pack-lock.json`. Restart Neovim after changing the plugin list.

## Completion and LSP

- Suggestions appear automatically from buffer words and attached LSP servers.
- Tab accepts a suggestion, starts completion after text, or advances a snippet.
- Shift-Tab selects the previous suggestion or jumps to the previous snippet field.
- Enter accepts a selected suggestion; otherwise it inserts a newline.
- Ctrl-Space starts completion; Ctrl-E cancels it.
- Ctrl-X Ctrl-F completes file paths. In `:`, suggestions appear as you type.
  Tab accepts the first or selected suggestion; arrow keys / Shift-Tab navigate.
- `s` in normal mode or `,s` in insert mode shows native signature help.
- `,f` formats through LSP; `:Mason` manages language-server installations.
- `:SetTab 2` sets indentation width in the current buffer.
- `:Cargo <args>` runs Cargo in the current working directory (for example, `:Cargo test`).
  Subcommands and installed extensions complete from `cargo --list` (cached per
  Neovim session); subsequent arguments use file completion.

`nvim-lspconfig` supplies server definitions; native `vim.lsp.config` and
`vim.lsp.enable` configure and start them. Tree-sitter still uses
`nvim-treesitter` to install parsers and support the local Lygos parser.

## Cleanup

The pre-cleanup config is saved in commit `42ea481`. `legacy.vim` has been
replaced with Lua settings, its `SetTab` command, and its Ctrl-Z mapping.
Filetype indentation is no longer reset on every file read.

Native completion and snippets replace nvim-cmp, its four completion sources,
and vim-vsnip. Native signature help replaces lsp_signature.nvim; signature
windows are now requested with the mappings above. Built-in Rust filetype
support replaces rust.vim.

Removed unused themes (gruvbox, Tokyo Night, Fluoromachine, Rose Pine),
the disabled smear cursor effect, ColorTuner, and the unconfigured DAP plugins.
Fugitive, LazyGit, Neoformat, and EasyMotion were removed as requested.
Telescope, its Plenary dependency, Mason, Tree-sitter, Lualine, devicons,
autopairs, whitespace highlighting, Fidget, compile-mode, and Gruber Darker remain.

Removed plugins are uninstalled through `vim.pack.del`, which also updates the
lockfile. Restoring the previous config lets `vim.pack` reinstall them.
