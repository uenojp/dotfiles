local wezterm = require("wezterm")

return {
  font = wezterm.font_with_fallback({ "Cica", "JetBrains Mono" }),
  font_size = 16.0,
  use_ime = true,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",

  -- Keybindgs: similar to tmux keybindings
  leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    -- Multiplexing
    -- https://wezfurlong.org/wezterm/multiplexing.html
    {
      key = "%",
      mods = "LEADER|SHIFT",
      action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
      key = '"',
      mods = "LEADER|SHIFT",
      action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    -- https://wezfurlong.org/wezterm/config/lua/keyassignment/SpawnTab.html
    { key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    -- https://wezfurlong.org/wezterm/config/lua/keyassignment/ActivateTabRelative.html
    { key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
    { key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
    -- https://wezfurlong.org/wezterm/config/lua/keyassignment/ActivateTab.html
    { key = "1", mods = "LEADER", action = wezterm.action.ActivateTab(0) },
    { key = "2", mods = "LEADER", action = wezterm.action.ActivateTab(1) },
    { key = "3", mods = "LEADER", action = wezterm.action.ActivateTab(2) },
    { key = "4", mods = "LEADER", action = wezterm.action.ActivateTab(3) },
    { key = "5", mods = "LEADER", action = wezterm.action.ActivateTab(4) },
    { key = "6", mods = "LEADER", action = wezterm.action.ActivateTab(5) },
    { key = "7", mods = "LEADER", action = wezterm.action.ActivateTab(6) },
    { key = "8", mods = "LEADER", action = wezterm.action.ActivateTab(7) },
    { key = "9", mods = "LEADER", action = wezterm.action.ActivateTab(8) },
    -- https://wezfurlong.org/wezterm/config/lua/keyassignment/ActivatePaneDirection.html
    { key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
    -- https://wezfurlong.org/wezterm/config/lua/keyassignment/AdjustPaneSize.html
    { key = "h", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Left", 2 }) },
    { key = "j", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Down", 2 }) },
    { key = "k", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Up", 2 }) },
    { key = "l", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Right", 2 }) },

    -- Copy Mode
    -- https://wezfurlong.org/wezterm/copymode.html
    { key = "[", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
  },
}
