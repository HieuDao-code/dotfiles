# Key bindings

- `<CR>` Enter
- `<M>` Meta (Alt)

## Information

- `<space>` leader key
- `:checkhealth [<pluginname>]` check base or plugin status
- `:checkhealth lsp` show details of LSP attached to buffer
- `:Lazy` or `<leader>l` show package manager UI
- `:Lazy profile` show startup time
- `:Mason` or `<leader>M` show Mason UI
- `:TSUpdate` update all Tree-sitter parsers
- `:ConformInfo` autoformatter information

## Working on text and code

#### <abbr title="blink.cmp">Autocomplete </abbr>

- `<C-space>` show autocompletion manually
- `<CR>` select and accept
- `<C-p>` select previous
- `<C-n>` select next
- `<C-k>` select signature

#### <abbr title="conform.nvim">Autoformatter</abbr>

- `<leader>f` format

#### Text editing

##### <abbr title="mini.ai">Around & Inside textobject</abbr>

- `a` around
- `i` inside
- `g[` goto start of `a` textobject
- `g]` goto end of `a` textobject

##### <abbr title="mini.move">Move selection </abbr>

Move selection in visual mode or current line

- `<M-h>` left
- `<M-j>` down
- `<M-k>` up
- `<M-l>` right

##### <abbr title="mini.surround">Surround</abbr>

- `ys{motion}{char}` add surrounding in Normal and Visual modes
- `ds{char}` delete surrounding
- `cs{target}{replacement}` replace surrounding

- `l` suffix to search with "prev" method
- `n` suffix to search with "next" method

#### <abbr title="nvim-treesitter">Treesitter</abbr>

##### Incremental selection

- `<C-space>` init selection
- `<C-space>` node incremental
- `bs` node decremental

##### Textobjects

- `af` select outer part of a method/function definition
- `if` select inner part of a method/function definition
- `ac` select outer part of a class
- `ic` select inner part of a class

##### Swap with next object

- `<leader>na` swap parameter/argument with next
- `<leader>pa` swap parameter/argument with next
- `<leader>nm` swap function with next
- `<leader>pm` swap function with next

##### Move

- `]f` next method/function def start
- `]F` next method/function def end
- `]c` next class start
- `]C` next class end
- `]a` next parameter/argument start
- `]A` next parameter/argument end

- `[f` prev method/function def start
- `[F` prev method/function def end
- `[c` prev class start

- `[a` prev parameter/argument start
- `[A` prev parameter/argument end

#### Language Server Protocol

- `grn` rename variable
- `gra` go to code action
- `grr` go to references
- `gri` go to implementation
- `grd` go to definition
- `grD` go to declaration
- `grt` go to type definition
- `g0` open document symbols
- `gW` open workspace symbols
- `<leader>th` toggle inlay hints

#### <abbr title="iron.nvim">Read Eval Print Loop</abbr>

- `<space>rc` send motion or visual
- `<space>rf` send whole file
- `<space>rl` send line below cursor
- `<space>rms` send the marked chunked
- `<space>rmc` marks text object
- `<space>rmc` marks visual selection
- `<space>rmd` removes set mark
- `<space>r<cr>` sends a return to the REPL
- `<space>r<space>` sends a `<C-c>` signal to the REPL
- `<space>rq` exits the REPL
- `<space>rx` clears the REPL window

- `<space>rs` open REPL for current or given filetype
- `<space>rr` restart the current REPL
- `<space>rF` focuses on the repl for current or given filetype
- `<space>rh` hide the repl window for current or given filetype

#### <abbr title="neotest">Testing</abbr>

- `<leader>tt` test run file
- `<leader>tT` test run all test files
- `<leader>tr` test run nearest
- `<leader>tl` test run last
- `<leader>ts` test toggle summary
- `<leader>to` test show output
- `<leader>tO` test toggle output panel
- `<leader>tS` test stop
- `<leader>tw` test toggle watch

#### <abbr title="nvim.dap">Debug Adapter Protocol</abbr>

- `<F5>` start/continue
- `<F1>` step into
- `<F2>` step over
- `<F3>` step out
- `<leader>db` toggle breakpoint
- `<leader>dB` set breakpoint condition
- `<leader>dr` toggle REPL
- `<leader>dq` toggle terminate debugger
- `<leader>du` toggle debugger ui

- `<leader>dn` test method
- `<leader>df` test class
- `<leader>ds` debug selection

#### Diagnostics

- `<leader>q` open diagnostic quickfix list
- `]d` move next diagnostics in the current buffer
- `[d` move previous diagnostics in the current buffer

- `<leader>xx` toggle trouble diagnostics
- `<leader>xX` toggle trouble diagnostics buffer

#### <abbr title="snacks.zen">Zen mode</abbr>

- `<leader>z` toggle zen mode
- `<leader>Z` toggle zoom

#### <abbr title="render-markdown.nvim">Markdown</abbr>

- `<leader>m` toggle markdown rendering

#### <abbr title="todo-comments.nvim">To-do comments</abbr>

- `]t` move to next to-do comments
- `[t` move to previous to-do comments

#### <abbr title="undotree">Undotree</abbr>

- `<leader>u` toggle undotree (use `?` for help)
- `J` move to the previous undo state
- `K` move to the next undo state

#### <abbr title="venv-selector.nvim">Venv selection</abbr>

- `<leader>v` search and activate a python virtual environment

## Working with files and navigating between files

#### <abbr title="harpoon">Harpoon</abbr>

- `<leader>h` attach harpoon to file
- `<C-e>` open harpoon quick menu
- `<leader>1-5` open harpoon file by index number

#### <abbr title="oil.nvim">Oil</abbr>

- `-` open parent directory

#### <abbr title="telescope.nvim">Telescope</abbr>

- `<leader>sh` search help
- `<leader>sk` search keymaps
- `<leader>sf` search files
- `<leader>ss` search select telescope
- `<leader>sw` search current word
- `<leader>sg` search by grep
- `<leader>sr` search resume
- `<leader>s.` search recent files ("." for repeat)
- `<leader>sb` search existing buffers
- `<leader>/` fuzzily search in current buffer
- `<leader>s/` search in open files
- `<leader>sn` search neovim files
- `<leader>sd` search dotfiles

#### <abbr title="tmux">Tmux</abbr>

- `<prefix>` key is `<C-a>`
- `<prefix>i` install new plugins
- `<prefix>r` refresh config file

##### Attach and detach

- `tmux` start new tmux session
- `tmux ls` list active tmux sessions
- `tmux attach` attach to tmux session running in the background
- `<prefix>d` detach from tmux session, leaving it running in the background
- `<prefix>&` exit and quit tmux
- `<prefix>?` list all keybindings (press Q to exit help screen)

##### Window management

- `<prefix>c` create new window
- `<M-S-h>` or `<S-Left>` move to previous window
- `<M-S-l>` or `<S-Right>` move to next window
- `<prefix>0-9` move to window by index number

##### Session management

- `<prefix>)` move to next session
- `<prefix>(` move to previous session
- `<prefix><C-z>` suspend session
- `<prefix>s` select a new session interactively
- `<prefix>f` tmux sessionizer (`<leader>f` if not in tmux)

##### Panes management

- `<prefix>%` split horizontally (panes side by side)
- `<prefix>"` split vertically (one pane below the other)
- `<prefix>h-j-k-l` or `<M-Up/Down/Left/Right>` move to other pane
- `<prefix>x` close current pane
- `<prefix>!` remove all panes but the current one from the window
- `<prefix>q` display window index numbers
- `<prefix><Up/Down>` resize current pane (due north/south)
- `<prefix><Left/Right>` resize current pane (due west/east)

##### Multiplex

- `<prefix>:` access tmux command prompt
- `<prefix>:setw synchronize-panes on` synchronize panes (to send a command to many hosts)

## <abbr title="i3 (or Aerospace for MacOS)">Window Management</abbr>

- `<M-(0-9)>` move to workspace by index number
- `<M-S-(0-9)>` move container to workspace by index number
- `<M-LeftMouse>` (`<M-CMD-LeftMouse>` on MacOS) move a container with mouse

## Git Integration

#### <abbr title="gitsigns.nvim">Gitsigns</abbr>

##### Navigation

- `]c` jump to next git change
- `]c` jump to previous git change

##### Visual mode

- `<leader>gs` git stage hunk
- `<leader>gr` git reset hunk

##### Normal mode

- `<leader>gs` git stage hunk
- `<leader>gr` git reset hunk
- `<leader>gu` git undo stage hunk
- `<leader>gp` git preview hunk
- `<leader>gS` git stage buffer
- `<leader>gR` git reset buffer
- `<leader>gb` git blame line
- `<leader>gB` git blame
- `<leader>gd` git diff against index
- `<leader>gD` git diff against last commit

##### Toggles

- `<leader>gtb` toggle git show blame line
- `<leader>gtD` toggle git show deleted

#### <abbr title="git-worktree.nvim">Git worktree</abbr>

- `<leader>gw` git worktree menu
- `<leader>gc` git create worktree

#### <abbr title="vim-fugitive">Fugitive</abbr>

- `:G` or `<leader>gg` open git summary window
- `:G {git command}` equals to `git {git command}`

## Miscellaneous

#### <abbr title="obsidian.nvim">Obsidian</abbr>
