local servers = {
	"pyright",
	"jsonls",
	"jdtls",
	"kotlin_language_server",
	"gradle_ls",
    "tsserver",
    "clangd",
    "rust_analyzer",
    "luau_lsp",
}

local settings = {
    providers = {
        "mason.providers.client",
        "mason.providers.registry-api",
    },
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason-lspconfig").setup_handlers {
  luau_lsp = function()
    require("luau-lsp").setup {
      server = { -- options passed to `require("lspconfig").luau_lsp.setup`
        filetypes = { "lua", "luau" }, -- default is { "luau" }
      },
    }
  end,
}
require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}


for _, server in pairs(servers) do
	opts = {
		on_attach = require("enzo.lsp.handlers").on_attach,
		capabilities = require("enzo.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "enzo.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end


-- Omnisharp/C#/Unity
local pid = vim.fn.getpid()
local omnisharp_bin = "omnisharp"
require'lspconfig'.omnisharp.setup{
    on_attach = require("enzo.lsp.handlers").on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
}
