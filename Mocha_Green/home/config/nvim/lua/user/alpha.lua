local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
[[                __                                              ]],
[[       ________|  |________                                     ]],
[[      |________    ________|      __                            ]],
[[        _______|  |_______       |  |             _--.          ]],
[[       |_______    _______|      |  |             \   \         ]],
[[     __________|  |__________    |  |              \   \        ]],
[[    |________________________|   |  |               \   \       ]],
[[         ________________        |  |                \   \      ]],
[[        |   __________   |       |  |                 |   |     ]],
[[        |  |__________|  |       |  |                 |   |､    ]],
[[        |   __________   |       |   |       /ヽ       |   |    ]],
[[        |  |__________|  |        |   |     /  ヽ      |   |    ]],
[[        |  |          |  |         |   ヽ__/   /      /   /     ]],
[[        |  |        __|  |          |         /      /___/      ]],
[[        |__|        \____|           ヽ______/                  ]],
}
dashboard.section.buttons.val = {
  dashboard.button("e", "" .. " New file", ":ene <CR>"),
  --dashboard.button("f", "" .. " Find file"),
  --dashboard.button("r", "" .. " Recent files"),
  --dashboard.button("t", "" .. " Find text"),
  dashboard.button("c", "" .. " Config", ":e $MYVIMRC <CR>"),
  dashboard.button("p", "" .. " Plugins", ":e $HOME/.config/nvim/lua/user/plugins.lua <CR>"),
  dashboard.button("q", "" .. " Quit", ":qa<CR>"),
}
local function footer()
  return "~愿此刻永遠是我们的晴天"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
