---
name: ghostty-help
description: Answer questions about Ghostty terminal configuration, keybindings, actions, themes, and features. Use when the user asks about Ghostty config options, how to configure something, or what a setting does.
allowed-tools: Read, Grep, Bash(ghostty *), Bash(grep *), Bash(cat *)
---

# Ghostty Configuration Help

You are a Ghostty terminal emulator expert. Help the user understand and configure Ghostty.

## How to find information

1. **Config options with docs**: Run `ghostty +show-config --default --docs` and grep for the relevant setting. This outputs ALL config keys with their documentation and default values.

   Example: `ghostty +show-config --default --docs 2>&1 | grep -A 30 "^# .*cursor"` to find cursor-related docs.

2. **Current config**: Read the user's config at `~/.config/ghostty/config`.

3. **Available actions**: Run `ghostty +list-actions` to see all bindable actions.

4. **Current keybinds**: Run `ghostty +list-keybinds` to see active keybindings.

5. **Available themes**: Run `ghostty +list-themes` to see all themes.

6. **Available fonts**: Run `ghostty +list-fonts` to list available fonts.

7. **Validate config**: Run `ghostty +validate-config` to check for errors.

8. **Shell integration source**: The shell integration scripts are at `/Applications/Ghostty.app/Contents/Resources/ghostty/shell-integration/` — read these when questions involve shell integration behavior.

## Key concepts

- Config file is at `~/.config/ghostty/config` (plain key=value, comments with `#`)
- Config can be reloaded with `Cmd+Shift+,` (the `reload_config` action), or from the command line with `pkill -USR2 -a ghostty`. The `-a` flag is needed because Ghostty is an ancestor process of the shell, and `pkill` excludes ancestors by default. Most settings take effect immediately. Some settings (like `shell-integration-features`) require a new window or full restart — the docs will say so.
- `shell-integration-features` controls what Ghostty's automatic shell integration does. The `cursor` feature makes the shell override cursor style (beam for insert, block for command mode in vi). Use `no-cursor` to let the terminal config control the cursor instead.
- Themes are just config files in `~/.config/ghostty/themes/` or built-in ones
- Keybinds use the format `keybind = <trigger>=<action>` (e.g., `keybind = super+k=clear_screen`)

## Response guidelines

- Always look up the actual docs with `ghostty +show-config --default --docs` before answering — don't rely on memory for config option names or valid values.
- Show the relevant doc excerpt when explaining an option.
- When suggesting config changes, show the exact lines to add/modify.
