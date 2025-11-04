return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- LSP Keybinds
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local telescope = require("telescope.builtin")
				local themes = require("telescope.themes")

				-- LSP navigation
				vim.keymap.set("n", "gr", function()
					telescope.lsp_references()
				end, { desc = "Show LSP references", buffer = ev.buf })
				vim.keymap.set("n", "gd", function()
					telescope.lsp_definitions()
				end, { desc = "Go to definition", buffer = ev.buf })
				vim.keymap.set("n", "gi", function()
					telescope.lsp_implementations()
				end, { desc = "Go to implementation", buffer = ev.buf })
				vim.keymap.set("n", "gt", function()
					telescope.lsp_type_definitions()
				end, { desc = "Go to type definition", buffer = ev.buf })
				-- Diagnostics navigation
				-- Diagnostics navigation (new API)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_prev({ wrap = false })
				end, { desc = "Go to previous diagnostic", buffer = ev.buf })
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_next({ wrap = false })
				end, { desc = "Go to next diagnostic", buffer = ev.buf })

				-- Diagnostics
				vim.keymap.set(
					"n",
					"<leader>dl",
					vim.diagnostic.open_float,
					{ desc = "Line diagnostics", buffer = ev.buf }
				)

				vim.keymap.set("n", "<leader>D", function()
					telescope.diagnostics({
						bufnr = 0,
						previewer = true,
						layout_strategy = "vertical",
						layout_config = { height = 0.7 },
					})
				end, { desc = "Buffer diagnostics", buffer = ev.buf })

				vim.keymap.set("n", "<leader>dw", function()
					telescope.diagnostics({
						previewer = true,
						layout_strategy = "vertical",
						layout_config = { height = 0.7 },
					})
				end, { desc = "Workspace diagnostics", buffer = ev.buf })

				-- Quickfix
				vim.keymap.set("n", "<leader>xq", function()
					telescope.quickfix()
				end, { desc = "Quickfix list", buffer = ev.buf })

				-- Code actions and rename
				vim.keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ desc = "Code actions", buffer = ev.buf }
				)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename", buffer = ev.buf })

				-- Hover & signature help
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation", buffer = ev.buf })
				vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = ev.buf })

				-- LSP restart
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP", buffer = ev.buf })
			end,
		})

		-- Diagnostic signs
		local signs = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
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
		vim.lsp.enable("lua_ls")

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
