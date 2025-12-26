return {
  -- =========================================================================
  -- 1. DISABLE CONFLICTING EXTRAS & DEFAULTS
  -- =========================================================================
  {
    "LazyVim/LazyVim",
    opts = {
      extras = {
        ["editor.snacks_picker"] = false,
        ["util.project"] = false,
      },
    },
  },

  -- Disable Snacks Dashboard
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      picker = { enabled = false },
    },
  },

  -- =========================================================================
  -- 2. MANUAL PROJECT SETUP
  -- =========================================================================
  {
    "ahmedkhalf/project.nvim",
    name = "project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        patterns = { ".git", "package.json", "*.sln", "*.csproj", "Makefile" },
        manual_mode = false,
      })
      pcall(function()
        require("telescope").load_extension("projects")
      end)
    end,
  },

  -- =========================================================================
  -- 3. AZOOZ ANIME DASHBOARD (Sparkle Edition)
  -- =========================================================================
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      -- HEADER: SPARKLE AZOOZ
      dashboard.section.header.val = {
        [[                                       ]],
        [[      ✨  .         * .       ✨ ]],
        [[        .    * .      .     * ]],
        [[                                        ]],
        [[    ▄▄▄   ███████╗ ██████╗  ██████╗ ███████╗ ]],
        [[   ████╗  ╚══███╔╝██╔═══██╗██╔═══██╗╚══███╔╝ ]],
        [[  ██╔═██╗   ███╔╝ ██║   ██║██║   ██║  ███╔╝  ]],
        [[  ███████╗ ███╔╝  ██║   ██║██║   ██║ ███╔╝   ]],
        [[  ██╔══██║███████╗╚██████╔╝╚██████╔╝███████╗ ]],
        [[  ╚═╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝ ]],
        [[                                        ]],
        [[            * . ( YO DADDY )   .    * ]],
        [[      ✨  .        * .       ✨ ]],
        [[                                        ]],
      }

      -- BUTTONS
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find File", "<cmd> Telescope find_files <cr>"),
        dashboard.button("n", " " .. " New File", "<cmd> ene <BAR> startinsert <cr>"),
        dashboard.button("p", " " .. " Projects", "<cmd> Telescope projects <cr>"),

        -- Custom: Next.js
        dashboard.button("N", " " .. " New Next.js App", function()
          os.execute("mkdir -p ~/projects/frontend")
          vim.cmd("term cd ~/projects/frontend && npx create-next-app@latest")
        end),

        -- Custom: .NET
        dashboard.button("C", "󰟉 " .. " New .NET API", function()
          os.execute("mkdir -p ~/projects/backend")
          vim.cmd("term cd ~/projects/backend && dotnet new webapi -n")
        end),

        dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
      }

      -- COLORS & FOOTER
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.val = { "Ready to build, Azooz." }

      return dashboard
    end,
    config = function(_, dashboard)
      require("alpha").setup(dashboard.opts)

      -- Hide statusline on dashboard
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          vim.opt.cmdheight = 0
          vim.opt.laststatus = 0
        end,
      })
      vim.api.nvim_create_autocmd("BufUnload", {
        buffer = 0,
        callback = function()
          vim.opt.laststatus = 3
          vim.opt.cmdheight = 1
        end,
      })
    end,
  },

  -- =========================================================================
  -- 4. FIXED .NET DEBUGGER (With Mason Rename Fix)
  -- =========================================================================
  {
    "mfussenegger/nvim-dap",
    -- FIXED: Changed 'williamboman/mason.nvim' to 'mason-org/mason.nvim'
    dependencies = { "rcarriga/nvim-dap-ui", "mason-org/mason.nvim" },
    config = function()
      local dap = require("dap")

      if not dap.adapters["netcoredbg"] then
        dap.adapters["netcoredbg"] = {
          type = "executable",
          command = vim.fn.exepath("netcoredbg") or "netcoredbg",
          args = { "--interpreter=vscode" },
        }
      end

      dap.configurations.cs = {
        {
          type = "netcoredbg",
          name = "Launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
        },
      }
    end,
  },
}
