---@diagnostic disable: unused-local

return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
      local lspConfig = require("lspconfig")
      local lspZero = require("lsp-zero")
      local mason = require("mason")
      local masonLspconfig = require("mason-lspconfig")

      lspZero.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>vsh", function() vim.lsp.buf.signature_help() end, opts)
      end)

      mason.setup()
      masonLspconfig.setup({
        ensure_installed = {
          "astro",
          "cssls",
          "eslint",
          "jsonls",
          "lua_ls",
          "marksman",
          "tailwindcss",
          "tsserver",
          "yamlls"
        }
      })

      local function rename_file()
        local source_file, target_file

        vim.ui.input({
          prompt = "Source: ",
          completion = "file",
          default = vim.api.nvim_buf_get_name(0)
        },
          function(input)
            source_file = input
          end
        )
        vim.ui.input({
          prompt = "Target: ",
          completion = "file",
          default = source_file
        },
          function(input)
            target_file = input
          end
        )

        local params = {
          command = "_typescript.applyRenameFile",
          arguments = {
            {
              sourceUri = source_file,
              targetUri = target_file,
            },
          },
          title = ""
        }

        vim.lsp.util.rename(source_file, target_file)
        vim.lsp.buf.execute_command(params)
      end

      lspConfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = {"vim"},
            },
          },
        },
      })

      lspConfig.jsonls.setup({})

      lspConfig.marksman.setup({})

      lspConfig.cssls.setup({
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "ignore"
            }
          },
          scss = {
            validate = true,
            lint = {
              unknownAtRules = "ignore"
            }
          },
          less = {
            validate = true,
            lint = {
              unknownAtRules = "ignore"
            }
          },
        }})

      lspConfig.eslint.setup({
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      lspConfig.tsserver.setup({
        commands = {
          RenameFile = {
            rename_file,
            description = "Rename File"
          },
        }
      })

      lspConfig.tailwindcss.setup({
        on_attach = function(_, bufnr)
          require("tailwindcss-colors").buf_attach(bufnr)
        end
      })

      lspConfig.yamlls.setup({
        settings = {
          yaml = {
            format = {
              enable = true,
            },
            validate = false,
            completion = true
          }
        }
      })
    end
  },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
}
