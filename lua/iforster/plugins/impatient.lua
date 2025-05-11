return {
  "lewis6991/impatient.nvim",
  priority = 1000, -- Load this plugin very early
  config = function()
    require("impatient")
  end,
}
