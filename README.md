# Settings for NEOVIM

This is my **init.vim** file for neovim on Mac. See [screenshots](#screenshots) for appearance.

**NOTE:** It requires `vim-plug` and [neovim](https://neovim.io/) with Python 3 in order to run correctly with all the plugins. Best to be used in iTerm 2 with 24-bit color support.

Run `:PlugInstall` command to install all the plugins.

__Side note__: Vim looks (in my opinion) best with light Sauce Code Pro font patched for both powerline **and** vim-devicons. If you change the font inside your terminal emulator, be sure it supports all these characters.

## Features & useful notes
* `<Leader>` is remapped to `,`
* `;` is remapped to act as `:`, saving you the SHIFT keystroke everytime running a command like `:w`
* Yanking and deleting puts the content into the system clipboard and can be used with CMD+C/CMD+V in insert mode or by pressing `p` in normal mode.
* Colorful dev icons in NERDTree
* Usage of arrow keys, enter, delete in insert mode etc. is allowed for the ease of use (and easier transitioning from traditional non-modal editors)
* Supports Javascript's ES6 import statements - hover a cursor over an imported file and press `gf` to open it
* Highlights CSS colors
* Every single command I added into the config is with a guiding comment. Read the whole config to get the best experience possible out of my settings.
* Uses tabline
* Hit `<f6>` to copy github address of currently opened file
* Hit `<f7>` to open Git Blame (from fugitive)
* Lints files (if node_modules/.bin/eslint exists) upon save or hitting `<f8>`
* Discover file in NERDTree when hitting `<f9>`
* Mapped `<f10>` to open .vimrc
* Respects .editorconfig
* Disabled .swp files

### To-do features
* Multistep revision system (more sophisticated than .swp files)

### Screenshots
![neovim-screenshot](screenshot.png?raw=true)
