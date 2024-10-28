-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure -- things
-- like custom filetypes. This just pure lua so anything that doesn't -- fit in the
-- normal config locations above can go here

-- Set autocommands
vim.api.nvim_create_augroup("packer_conf", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Sync packer after modifying plugins.lua",
  group = "packer_conf",
  pattern = "plugins.lua",
  command = "source <afile> | PackerSync",
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Ejecuta el comando de terminal para ajustar el padding en kitty
    vim.fn.system "kitten @ set-spacing padding-left=0 padding-top=0"
  end,
  desc = "Remove padding in Kitty on VimEnter",
})

-- Restaurar padding en Kitty al cerrar Neovim
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function() vim.fn.system "kitten @ set-spacing padding-left=default padding-top=default" end,
  desc = "Restore default padding in Kitty on VimLeave",
})
