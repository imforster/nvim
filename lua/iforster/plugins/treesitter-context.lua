return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  config = function()
    require("treesitter-context").setup({
      enable = true,
      max_lines = 3,
      trim_scope = "outer",
      patterns = {
        default = {
          "class",
          "function",
          "method",
          "for",
          "while",
          "if",
          "switch",
          "case",
        },
      },
    })
  end,
}
