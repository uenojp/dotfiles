local wezterm = require 'wezterm';

return {
    font = wezterm.font_with_fallback {
      'Cica',
      'JetBrains Mono',
    },
    use_ime = true,
    hide_tab_bar_if_only_one_tab = true,
    adjust_window_size_when_changing_font_size = false,
}

