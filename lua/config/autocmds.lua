-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
---- Automatically change directory and update LSP when switching tabs
vim.api.nvim_create_autocmd("TabEnter", {
  callback = function()
    local dir = vim.fn.getcwd(-1, vim.api.nvim_get_current_tabpage())
    vim.api.nvim_set_current_dir(dir)
    -- This triggers Neoconf to reload the settings for the new directory
    require("neoconf").setup()
    print("📂 Switched to: " .. vim.fn.fnamemodify(dir, ":t"))
  end,
})
