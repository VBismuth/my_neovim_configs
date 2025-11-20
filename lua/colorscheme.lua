-- Colorschemes:
-- from catppuccin/nvim : catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

local colorscheme = "catppuccin-macchiato"

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
