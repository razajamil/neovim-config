return {
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      filter = "machine",
    },
  },
  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "maia"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
