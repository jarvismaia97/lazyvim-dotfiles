local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- ── Font ────────────────────────────────────────────────────
config.font = wezterm.font_with_fallback({
  { family = "JetBrains Mono", weight = "Medium" },
  { family = "Symbols Nerd Font Mono" },
  "Apple Color Emoji",
})
config.font_size = 14.0
config.line_height = 1.2
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" } -- Ligatures

-- ── Appearance ──────────────────────────────────────────────
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.92
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"  -- No title bar, just resize handles

config.window_padding = {
  left = 16,
  right = 16,
  top = 12,
  bottom = 8,
}

-- Tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_max_width = 32

config.colors = {
  tab_bar = {
    background = "#1e1e2e",
    active_tab = {
      bg_color = "#313244",
      fg_color = "#cdd6f4",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#1e1e2e",
      fg_color = "#6c7086",
    },
    new_tab = {
      bg_color = "#1e1e2e",
      fg_color = "#6c7086",
    },
  },
}

-- ── Cursor ──────────────────────────────────────────────────
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- ── Performance ─────────────────────────────────────────────
config.max_fps = 120
config.animation_fps = 60
config.front_end = "WebGpu"           -- GPU acceleration
config.scrollback_lines = 10000

-- ── Keys ────────────────────────────────────────────────────
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
  -- Pane splits (like tmux)
  { key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "-", mods = "LEADER",       action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

  -- Navigate panes
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

  -- Also with Ctrl (no leader needed)
  { key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },

  -- Resize panes
  { key = "H", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
  { key = "J", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
  { key = "K", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
  { key = "L", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },

  -- Close pane
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

  -- Tabs
  { key = "c", mods = "LEADER",  action = act.SpawnTab("CurrentPaneDomain") },
  { key = "n", mods = "LEADER",  action = act.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER",  action = act.ActivateTabRelative(-1) },
  { key = "1", mods = "LEADER",  action = act.ActivateTab(0) },
  { key = "2", mods = "LEADER",  action = act.ActivateTab(1) },
  { key = "3", mods = "LEADER",  action = act.ActivateTab(2) },
  { key = "4", mods = "LEADER",  action = act.ActivateTab(3) },
  { key = "5", mods = "LEADER",  action = act.ActivateTab(4) },

  -- Zoom pane (toggle fullscreen for current pane)
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

  -- Quick actions
  { key = "f", mods = "CMD",       action = act.Search({ CaseInSensitiveString = "" }) },
  { key = "k", mods = "CMD",       action = act.ClearScrollback("ScrollbackAndViewport") },
  { key = "Enter", mods = "CMD",   action = act.ToggleFullScreen },

  -- Font size
  { key = "+", mods = "CMD|SHIFT", action = act.IncreaseFontSize },
  { key = "-", mods = "CMD",       action = act.DecreaseFontSize },
  { key = "0", mods = "CMD",       action = act.ResetFontSize },

  -- Copy mode (like tmux copy mode)
  { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
}

-- Quick tab switching with CMD+number
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "CMD",
    action = act.ActivateTab(i - 1),
  })
end

-- ── Mouse ───────────────────────────────────────────────────
config.mouse_bindings = {
  -- Ctrl-click to open links
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CMD",
    action = act.OpenLinkAtMouseCursor,
  },
}

-- ── Status Bar ──────────────────────────────────────────────
wezterm.on("update-right-status", function(window, pane)
  local cwd = pane:get_current_working_dir()
  local dir = ""
  if cwd then
    dir = cwd.file_path or ""
    dir = dir:gsub("^/Users/%w+", "~")  -- Shorten home dir
  end

  local time = wezterm.strftime("%H:%M")

  window:set_right_status(wezterm.format({
    { Foreground = { Color = "#6c7086" } },
    { Text = " " .. dir .. "  " },
    { Foreground = { Color = "#89b4fa" } },
    { Text = time .. " " },
  }))
end)

return config
