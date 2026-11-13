return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      { "j-hui/fidget.nvim", opts = {} },

      -- TODO: `cmp` for code completion, `conform` for automatic formatting.

      "b0o/schemastore.nvim",
    },
    config = function()
      vim.api.nvim_create_autocmd({ "LspAttach" }, {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(args)
          vim.diagnostic.config({ virtual_lines = false })
          vim.diagnostic.config({ virtual_text = false })
          vim.diagnostic.config({
            signs = {
              text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.INFO] = "",
                [vim.diagnostic.severity.HINT] = "",
              },
              linehl = {},
              numhl = {
                [vim.diagnostic.severity.ERROR] = "ErrorMsg",
                [vim.diagnostic.severity.WARN] = "WarningMsg",
                [vim.diagnostic.severity.INFO] = "OkMsg",
              },
            },
          })

          local bufnr = args.buf
          local lsp_map = function(cmd, fn, desc)
            vim.keymap.set("n", cmd, fn, { buffer = bufnr, desc = "[LSP] " .. desc })
          end

          local builtin = require("telescope.builtin")
          lsp_map("gd", vim.lsp.buf.definition, "Jump to definition")
          lsp_map("gD", vim.lsp.buf.declaration, "Jump to declaration")
          lsp_map("gT", vim.lsp.buf.type_definition, "Jump to type definition")
          lsp_map("gr", builtin.lsp_references, "Jump to references")
          lsp_map("gi", builtin.lsp_implementations, "Jump to implementations")

          lsp_map("<leader>f", builtin.lsp_document_symbols, "Search file symbols")
          lsp_map("<leader>w", builtin.lsp_dynamic_workspace_symbols, "Search workspace symbols")

          lsp_map("<leader>rn", vim.lsp.buf.rename, "Rename identifier")
          lsp_map("<leader>i", vim.lsp.buf.code_action, "Trigger code action")
          lsp_map("K", vim.lsp.buf.hover, "Open documentation")

          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            lsp_map("<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, "Toggle inlay hints")
          end

          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = bufnr,
              group = highlight_group,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = bufnr,
              group = highlight_group,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
              callback = function(args)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "lsp_highlight", buffer = args.buf })
              end,
            })
          end
        end,
      })

      local capabilities = nil
      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      local ensure_installed = {
        "lua_ls",
        "stylua",
      }

      require("mason").setup()
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
      -- WARN: This is probably wrong.
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            vim.lsp.config[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
