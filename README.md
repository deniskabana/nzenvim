# IDE mode for Neovim

Use this **init.vim** file for neovim (only tested on Mac). See [screenshots](#screenshots) for the appearance. It is meant to help you transition from any conventional IDE to VIM, allowing you the use of cursor keys, mouse, 32-bit colors, fancy-looking plugins (to enhance the visual experience). To get the best experience possible however, use the cursor keys and mouse only when it is absolutely necessary.

**This config is optimized for Javascript development.** But it supports all other languages and once you learn how to use it in general, you can customize it (or fork this repo) however you want. Happy vimming :)

**NOTE:** It requires `vim-plug` and [neovim](https://neovim.io/) with Python 3 in order to run correctly with all the plugins. Best to be used in iTerm 2 with 24-bit color support.

Run `:PlugInstall` command to install all the plugins in this configuration model.

__Side note__: Vim looks (in my humble opinion) best with the light Sauce Code Pro font patched for both powerline **and** vim-devicons (instructions to be found in the [vim-devicons repo](https://github.com/ryanoasis/vim-devicons). If you change the font inside your terminal emulator (I recommend iTerm 2/3), be sure it supports all these characters. Otherwise powerline patched visuals or devicons might not work.

## How to Git with this vim config?
Just don't use vim for git merging or conflict resolving. It can get pretty messy and I left that idea the first time I had to fix more than 90 consecutive lines of conflicts, with 4 open views of the same file on a Macbook Air screen.

Much more I recommend the usage of Apple's own free-to-use - XCode's `FileMerge`. It can be controlled entirely with keyboard and works perfectly for resolving conflicts. You can combine this with the `git mergetool` command. Works like a charm. [More on this here.](https://gist.github.com/kylefox/4512777)

[Read more about vim-fugitive plugin.](https://github.com/tpope/vim-fugitive)

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
* Respects .editorconfig files per-project
* Disabled .swp files - increased the speed and tidied the mess vim leaves

### To-do features
* Multistep revision system (more sophisticated than .swp files)
* Support of ligatures (once iTerm and neovim both officially support text replacement)

### Screenshots
![neovim-screenshot](screenshot.png?raw=true)
