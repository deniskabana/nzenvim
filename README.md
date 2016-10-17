# Settings for NEOVIM

This is my **init.vim** file for neovim on Mac. See [screenshots](#screenshots) for appearance.

**NOTE:** It requires `vim-plug` and [neovim](https://neovim.io/) with Python 3 in order to run correctly with all the plugins. Best to be used in iTerm 2 with 24-bit color support.

Run `:PlugInstall` command to install all the plugins.

## Features & useful notes
* `<Leader>` is remapped to `,`
* `;` is remapped to act as `:`, saving you the SHIFT keystroke everytime running a command like `:w`
* Yanking and deleting puts the content into the system clipboard and can be used with CMD+C/CMD+V in insert mode or by pressing `p` in normal mode.
* Usage of arrow keys, enter, delete in insert mode etc. is allowed for the ease of use (and easier transitioning from traditional non-modal editors)
* Neovim starts with the NERDTree plugin opened
* Every single command I added into the config is with a guiding comment. Read the whole config to get the best experience possible out of my settings.
* Lints files (if node_modules/.bin/eslint exists) upon save or hitting `<f8>`
* Discover file in NERDTree when hitting `<f9>`
* Mapped `<f10>` to open .vimrc
* Respects .editorconfig

### To-do features
*Currently none :-)*

### Screenshots
![neovim-screenshot](screenshot.png?raw=true)
![neovim-screenshot2](screenshot2.png?raw=true)
