return {
  -- 1. CSV & Data Support
  { "mechatroner/rainbow_csv", ft = { "csv", "tsv" } },

  -- 2. Ensure Treesitter has all your grammars
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "c_sharp",
          "tsx",
          "typescript",
          "json",
          "csv",
          "css",
          "html",
        })
      end
    end,
  },

  -- 3. Unified LSP Config for C# (OmniSharp + Roslyn/Dotnet)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Enable OmniSharp explicitly
        omnisharp = {
          settings = {
            FormattingOptions = {
              EnableEditorConfigSupport = true,
              OrganizeImports = true,
            },
            RoslynExtensionsOptions = {
              EnableDecompilationSupport = true,
              EnableImportCompletion = true,
              AnalyzeOpenDocumentsOnly = false,
            },
          },
        },
        -- The modern csharp_ls (often used by lang.dotnet)
        csharp_ls = {},
      },
    },
  },

  -- 4. Formatter Config (Prettier for Frontend, CSharpier for Backend)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        cs = { "csharpier" },
      },
    },
  },
}
