return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", event = "LspAttach" }, -- Changed: only load when LSP attaches
		"williamboman/mason.nvim", -- Added: ensure mason loads before lspconfig
	},
	config = function()
		-- NOTE: LSP Keybinds
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true, noremap = true }
				opts.desc = "Show LSP references"
				vim.keymap.set("n", "grr", "<cmd>Telescope lsp_references<CR>", opts)
				opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "gri", "<cmd>Telescope lsp_implementations<CR>", opts)
				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "grt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				opts.desc = "See available code actions"
				vim.keymap.set("n", "gra", vim.lsp.buf.code_action, opts)
				opts.desc = "Smart rename"
				vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
				opts.desc = "Show line diagnostics"
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
				opts.desc = "Show signature help"
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
			end,
		})
		
		-- Diagnostic signs
		local signs = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		}
		vim.diagnostic.config({
			signs = { text = signs },
			virtual_text = true,
			underline = true,
			update_in_insert = false,
		})
		
		-- LSP capabilities
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		vim.lsp.config("*", { capabilities = capabilities })
		
		-- Configure LSP servers
		-- lua_ls
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")
		
		-- Python
		vim.lsp.config("pyright", {
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true,
					},
				},
			},
		})
		vim.lsp.enable("pyright")
		
		-- Emmet servers
		vim.lsp.config("emmet_language_server", {
			filetypes = {
				"css",
				"eruby",
				"html",
				"javascript",
				"javascriptreact",
				"less",
				"sass",
				"scss",
				"pug",
				"typescriptreact",
			},
			init_options = { showAbbreviationSuggestions = true, showExpandedAbbreviation = "always" },
		})
		vim.lsp.enable("emmet_language_server")
		
		vim.lsp.config("emmet_ls", {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})
		vim.lsp.enable("emmet_ls")
		
		-- TypeScript/JavaScript
		vim.lsp.config("ts_ls", {
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			single_file_support = true,
			init_options = {
				preferences = {
					includeCompletionsForModuleExports = true,
					includeCompletionsForImportStatements = true,
				},
			},
		})
		vim.lsp.enable("ts_ls")
		
		-- Go
		vim.lsp.config("gopls", {
			settings = {
				gopls = {
					analyses = { unusedparams = true },
					staticcheck = true,
					gofumpt = true,
				},
			},
		})
		vim.lsp.enable("gopls")
	end,
}
