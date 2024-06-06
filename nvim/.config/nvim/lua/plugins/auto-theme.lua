return {
  "f-person/auto-dark-mode.nvim",
  config = {
    dependencies = {'olimorris/onedarkpro.nvim'},
    priority = 1000,
    update_interval = 1000,
    set_dark_mode = function()
      vim.cmd("colorscheme onedark")
    end,
    set_light_mode = function()
      vim.cmd("colorscheme onelight")
    end,
  },
  init = function()
    require("auto-dark-mode").init()
  end,
}
