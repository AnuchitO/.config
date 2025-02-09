# Keep the config file in the same directory as the script

## Alacritty
alacritty:
	# Path to the alacritty config file
	config_path: ~/.config/alacritty/alacritty.toml
using themes: [dracula](https://github.com/dracula/alacritty)
by git clone it to `~/.config/alacritty/themes/dracula`
TODO: add a script to automate this process. consider using `dotfiles`

## Github Copilot

## Workflows
### Change the location directory in terminal

- [zoxide](https://github.com/ajeetdsouza/zoxide)

```bash
z foo<SPACE><TAB>  # show interactive completions (zoxide v0.8.0+, bash 4.4+/fish/zsh only)
```

### Open a project in terminal with Tmux session and nvim using fzf

- [fzf](https://github.com/junegunn/fzf)
it will use find then open the project in terminal with Tmux session and nvim

- `ctrl + o` to open the *PROJECT FOLDER* in Tmux session with nvim

```bash
~/.config/fzf/config.sh
```

- `ctrl + p` to open a file in nvim (using fuzzy finder all files under specific directory that define in `~/.config/fzf/config.sh`)

```bash
~/.config/fzf/config.sh files
```
- `ctrl + xxx` to open a *PROJECT FOLDER* in Tmux session with nvim (using fuzzy finder all FOLDER under specific directory that define in `~/.config/fzf/config.sh`)

```bash
~/.config/fzf/config.sh folders
```

