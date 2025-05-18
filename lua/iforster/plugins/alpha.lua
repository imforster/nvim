return {
  "goolord/alpha-nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    -- Custom header (ASCII art)
    dashboard.section.header.val = {
      "         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
      "         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z   ",
      "         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z      ",
      "         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z        ",
      "         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║          ",
      "         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝          ",
      "    Customized by Ian Forster",
    }

    -- Buttons (center actions)
    dashboard.section.buttons.val = {
      dashboard.button("SPC ff", "󰱼  Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("n", "  New File", ":ene | startinsert <CR>"),
      dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", "  Find Text", ":Telescope live_grep <CR>"),
      dashboard.button("s", "  Restore Session", ":lua require('persistence').load()<CR>"),
      dashboard.button("x", "  Lazy Extras", ":LazyExtras <CR>"),
      dashboard.button("l", "󰒲  Lazy", ":Lazy <CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Footer with plugin stats
    dashboard.section.footer.val = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
    end

    dashboard.opts.layout[1].val = 8 -- Top padding (similar to `string.rep("\n", 8)`)

    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        if vim.o.filetype == "lazy" then
          vim.cmd.close()
          vim.schedule(function()
            require("lazy").show()
          end)
        end
      end,
    })

    return dashboard.opts
  end,
}
