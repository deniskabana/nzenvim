# Settings for NEOVIM

This is my **init.vim** file where I'll keep my settings and updates up-to-date with my VIM.

**NOTE:** It requires `vim-plug` and [neovim](https://neovim.io/) with Python 3 in order to run correctly with all the plugins. Best used from iTerm 2 with 24-bit color support.

Run `:PlugInstall` command to install all plugins.

**Useful notes:** 
* `<Leader>` is mapped to `,` and `;` is remapped to act as `:` saving SHIFT keystroke everytime.
* Yanking and deleting puts the content into system clipboard and CMD+C and CMD+V insert it into terminal window.
* Usage of arrow keys, mouse, enter in insert mode etc. is allowed for ease of use (and easier transition from traditional non-modal editors)
* Neovim starts with NERDTree opened
* Every single command I added into config is well commented. Read it to get the best out of my settings.

### Screenshots from using neovim.
![neovim-screenshot](screenshot.png?raw=true)
![neovim-screenshot2](screenshot2.png?raw=true)

### To be added
* Support for .editorconfig in vim
* Built-in javascript linting
