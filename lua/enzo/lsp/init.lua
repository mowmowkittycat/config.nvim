local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "enzo.lsp.mason"
require("enzo.lsp.handlers").setup()
require "enzo.lsp.null-ls"
