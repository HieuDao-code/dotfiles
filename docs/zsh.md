# Zsh

Zsh is a powerful shell that operates as both an interactive shell and as a scripting language interpreter.

[Install instruction](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

I use [git subtree](https://gist.github.com/HieuDao-code/096139d00fd8c38b5a4ec8878550100d) to manage zsh plugins. To update the zsh plugins use `git subtree pull`:

```sh
git subtree pull --prefix config/zsh/plugins/fzf-tab https://github.com/Aloxaf/fzf-tab master --squash
git subtree pull --prefix config/zsh/plugins/zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions.git master --squash
git subtree pull --prefix config/zsh/plugins/zsh-completions https://github.com/zsh-users/zsh-completions.git master --squash
git subtree pull --prefix config/zsh/plugins/zsh-history-substring-search https://github.com/zsh-users/zsh-history-substring-search.git master --squash
git subtree pull --prefix config/zsh/plugins/zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git master --squash
```

## Plugins

| Name                                                                                      | Description                                              |
| ----------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| [fzf](https://github.com/junegunn/fzf)                                                    | fzf is a general-purpose command-line fuzzy finder       |
| [fzf-tab](https://github.com/Aloxaf/fzf-tab)                                              | Replace zsh's default completion selection menu with fzf |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)                   | Fish-like autosuggestions for Zsh                        |
| [zsh-completions](https://github.com/zsh-users/zsh-completions)                           | Additional completion definitions for Zsh                |
| [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) | Zsh port of Fish history search                          |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)           | Fish shell like syntax highlighting for Zsh              |
| [zoxide](https://github.com/ajeetdsouza/zoxide)                                           | A smarter cd command                                     |
