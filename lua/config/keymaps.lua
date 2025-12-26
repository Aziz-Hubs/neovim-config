-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
---- Custom function to launch your specific Full-Stack Workspace
-- Custom function to launch your workspace
local function launch_fullstack()
  -- CHANGE THESE to your actual project paths!
  local frontend = "~/path/to/your/nextjs-project"
  local backend = "~/path/to/your/dotnet-project"

  -- Open Frontend in Tab 1
  vim.cmd("tabnew")
  vim.cmd("cd " .. frontend)
  -- Automatically open the file explorer in the new tab
  if vim.fn.exists(":Neotree") > 0 then
    vim.cmd("Neotree")
  else
    vim.cmd("Ex")
  end

  -- Open Backend in Tab 2
  vim.cmd("tabnew")
  vim.cmd("cd " .. backend)
  if vim.fn.exists(":Neotree") > 0 then
    vim.cmd("Neotree")
  else
    vim.cmd("Ex")
  end

  print("🚀 Full-Stack Workspace Loaded!")
end

-- Keymap: Press <leader>fw (Find Workspace)
vim.keymap.set("n", "<leader>fw", launch_fullstack, { desc = "Launch Full-Stack Workspace" })

-- Floating Terminal for Frontend (Next.js)
vim.keymap.set("n", "<leader>tf", function()
  Snacks.terminal("npm run dev", { win = { relative = "editor", width = 0.8, height = 0.8 } })
end, { desc = "Terminal: Next.js Dev" })

-- Floating Terminal for Backend (.NET)
vim.keymap.set("n", "<leader>tb", function()
  Snacks.terminal("dotnet watch", { win = { relative = "editor", width = 0.8, height = 0.8 } })
end, { desc = "Terminal: .NET Watch" })

-- F5 to Build and Debug .NET
vim.keymap.set("n", "<F5>", function()
  -- 1. Save all files
  vim.cmd("wa")

  -- 2. Run dotnet build in a hidden terminal
  print("Building .NET Project...")
  local build_cmd = "dotnet build"

  vim.fn.jobstart(build_cmd, {
    on_exit = function(_, code)
      if code == 0 then
        print("Build Successful! Starting Debugger...")
        require("dap").continue()
      else
        print("Build Failed! Check errors.")
      end
    end,
  })
end, { desc = "Build and Debug .NET" })
