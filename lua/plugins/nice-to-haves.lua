return {
  -- =========================================================================
  -- 1. TAILWIND COLORS (Vital for Next.js)
  -- Shows actual color blocks (e.g., a red box next to "bg-red-500")
  -- =========================================================================
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    opts = {
      render = "background", -- Display style: 'background' | 'foreground' | 'virtual'
      enable_tailwind = true, -- Enable Tailwind CSS support
    },
  },

  -- =========================================================================
  -- 2. AUTO-CLOSE TAGS (Vital for React/JSX)
  -- When you type <div>, it automatically adds </div>.
  -- =========================================================================
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },

  -- =========================================================================
  -- 3. TOGGLE TERMINAL (Better than :term)
  -- Press Ctrl+\ to toggle a floating terminal instantly.
  -- Great for running 'dotnet watch' or 'npm run dev' without leaving the code.
  -- =========================================================================
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]], -- The shortcut (Ctrl + Backslash)
      direction = "float", -- 'float' | 'horizontal' | 'vertical'
      float_opts = {
        border = "curved", -- Nice curved border
        title_pos = "center",
      },
    },
  },

  -- =========================================================================
  -- 4. TODO COMMENTS (Organization)
  -- Highlights TODO, FIXME, BUG, HACK in bright colors.
  -- You can search them with :TodoTelescope
  -- =========================================================================
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPost",
    opts = {
      -- Custom Azooz colors if you want, otherwise defaults are great
    },
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next Todo Comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous Todo Comment",
      },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search Todos" },
    },
  },

  -- =========================================================================
  -- 5. SMOOTH SCROLLING (Visual Pleasure)
  -- Makes jumping between C# methods feel silky smooth instead of jerky.
  -- =========================================================================
  {
    "karb94/neoscroll.nvim",
    opts = {
      -- All defaults are good, just enabling it makes it smooth
      easing_function = "quadratic",
    },
  },
}
