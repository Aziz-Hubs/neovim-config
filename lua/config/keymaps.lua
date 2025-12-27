-- Keybindings for ChatGPT.nvim
-- gen.nvim Keymaps

-- <leader>ai: Ask/Chat with AI (opens the main Gen prompt window)
vim.keymap.set("n", "<leader>ai", "<cmd>Gen<CR>", { desc = "Gen: Ask AI" })

-- gen.nvim Keymaps (Corrected)

-- gen.nvim Keymaps (Corrected based on documentation)

-- <leader>ai: Opens the main prompt window
vim.keymap.set("n", "<leader>ai", "<cmd>Gen<CR>", { desc = "Gen: Ask AI" })

-- <leader>ae: Edit selected code
-- In visual mode, this will open a prompt to edit the selection
vim.keymap.set("v", "<leader>ae", "<cmd>Gen<CR>", { desc = "Gen: Edit Selection" })

-- <leader>ax: Explain selected code
-- In visual mode, this will open a prompt with the selection,
-- where you can then type "Explain this code"
vim.keymap.set("v", "<leader>ax", "<cmd>Gen<CR>", { desc = "Gen: Explain/Prompt Selection" })
-- You can use Tab to accept them.
--
-- Keymap to open a terminal
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- Keymap to run 'npm run dev' in a terminal
vim.keymap.set("n", "<leader>rn", function()
  -- Open a terminal and run the dev command
  local term = require("toggleterm.terminal").Terminal:new({ cmd = "npm run dev", direction = "float" })
  return term:toggle()
end, { desc = "Run Next.js Dev" })
