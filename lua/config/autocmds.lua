-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
vim.api.nvim_create_autocmd({ "ColorScheme", "FileType" }, {
  pattern = { "*", "javascriptreact", "typescriptreact" },
  callback = function()
    local sonokai_red = "#fc5d7c" -- This is Sonokai's main red color
    local white = "#ffffff"

    local highlight_overrides = {
      -- JSX/TSX tags (red)
      {
        groups = {
          "@tag.tsx",
          "@tag.jsx",
          "@tag.delimiter.tsx",
          "@tag.delimiter.jsx",
          "@tag",
          "@tag.delimiter",
        },
        color = sonokai_red,
      },
      -- You can add more arrays here for different colors
      {
        groups = {
          "@tag.attribute.tsx",
          "@tag.attribute.jsx",
          "@tag.attribute",
          "@variable.member.tsx",
          "@lsp.type.property.typescriptreact",
        },
        color = white,
      },
    }

    for _, override in ipairs(highlight_overrides) do
      for _, group in ipairs(override.groups) do
        local existing = vim.api.nvim_get_hl(0, { name = group })
        -- local hl_opts = vim.tbl_extend("force", existing, { fg = override.color })
        vim.api.nvim_set_hl(0, group, { fg = override.color })
      end
    end

    local italic_overrides = {
      groups = {
        "@string",
        "@string.jsx",
        "@string.tsx",
        "@string.typescript",
        "@string.javascript",
        "String",
        "stringLiteral",
      },
    }

    -- x for _, group in ipairs(italic_overrides.groups) do
    --   local existing = vim.api.nvim_get_hl(0, { name = group })
    --   -- local hl_opts = vim.tbl_extend("force", existing, { italic = true })
    --   vim.api.nvim_set_hl(0, group, { italic = true, fg = existing.fg })
    -- end
    --
    -- JSX tags
    -- vim.api.nvim_set_hl(0, "@tag.tsx", { fg = sonokai_red })
    -- vim.api.nvim_set_hl(0, "@tag.jsx", { fg = sonokai_red })
    -- vim.api.nvim_set_hl(0, "@tag.delimiter.tsx", { fg = sonokai_red })
    -- vim.api.nvim_set_hl(0, "@tag.delimiter.jsx", { fg = sonokai_red })
    --
    -- -- JSX attributes
    -- vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = white })
    -- vim.api.nvim_set_hl(0, "@tag.attribute.jsx", { fg = white })
    --
    -- vim.api.nvim_set_hl(0, "@variable.member.tsx", { fg = white })

    -- Generic fallbacks
    -- vim.api.nvim_set_hl(0, "@tag", { fg = sonokai_red })
    -- vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = sonokai_red })
    -- vim.api.nvim_set_hl(0, "@tag.attribute", { fg = sonokai_red })
  end,
})
