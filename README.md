![neovim-screenshot](screenshot.png?raw=true)
# Neovim for JavaScript
#### Works with everything too.

This .vimrc was built for personal use with modren Javascript and is therefore not optimized for other heavy usage.

I use vim **full-time**. And to be able to do that, I had to create *the perfect config™*. And it also looks good and modern with this config (see the screenshot for yourself).

This is a config file for [NeoVim](https://neovim.io/). For the best experience, I recommend using it with [iTerm 2+](https://www.iterm2.com/).

**Most notable features** (this should peak your interest):
* System clipboard using -> also supports CMD + C/V
* Leader remapped to `,`
* Allows the use of arrow keys, mouse (if terminal emulator does), etc.
* No internal syntax checker. They are just annoying.
* Editorconfig support
* No swap files (*.swp)!
* CommonJS modules support
* CSS color highlights in text
* Colored file icons in NERDTree
* Displays trailing characters
* **AND IT'S STILL BLAZING FAST WITH THESE SETTINGS!**
Go on, read the [vimrc](https://github.com/leonapoleon/vimrc/blob/master/init.vim) for full features list.

#### List of requirements before using
* [vim-plug](https://github.com/junegunn/vim-plug)
* Python 3 installed
* neovim

#### What I also recommend
* Any patched font, with devicons *(without patched fonts, disable devicons or patched fonts settings)*

## Who is this config for?
Everyone. It's **great for beginners** because it allows mouse and arrow keys, more than **great for pro users**. It is now an IDE as you know them. I successfully replaced Sublime Text & Atom with Vim more than a year and a half ago. I'd never go back.

If you've never used vim, try the `vimtutor` first, vim without plugins second and just then come back to this repo.

Why you ask... Because the speed of vim and working solely inside a terminal drives you towards learning much more about the software you work with. Take that as a professional benefit.

## Getting started
Author's note: Create an zsh/bash alias - use `vim` instead of `nvim`. Neat.

Before you open vim with my config, be sure to meet requirements and preferably also recommendations. Once you open vim with this config, you're probably going to get a few errors. That's okay, bear with me... Hit `:PlugInstall`, quit and re-open vim and it should look good now.

To fully utilize it's power check the readme for every plugin installed. Well worth it.

## Notes and important key shortcuts
* <kbd>Ctrl</kbd>+<kbd>P</kbd> / <kbd>,</kbd><kbd>o</kbd> => Runs CtrlP fuzzy file finder
* <kbd>,</kbd><kbd>b</kbd> => Runs the same fuzzy finder for Buffers
* <kbd>,</kbd><kbd>f</kbd> => Fuzzy finder for recently open files
* <kbd>j</kbd><kbd>j</kbd> => Exit insert mode
* <kbd>K</kbd><kbd>K</kbd> => Add a line below the cursor staying in normal mode
* <kbd>K</kbd><kbd>L</kbd> => Add a line above the cursor staying in normal mode
* <kbd>Ctrl</kbd>+<kbd>L</kbd> => Disable search highlight (equivalent to `:nohl`)
* <kbd>,</kbd><kbd>k</kbd><kbd>b</kbd> => Toggle NERDTree
* <kbd>f10</kbd> => Open vimrc
* <kbd>,</kbd><kbd>c</kbd><kbd>space</kbd> => Toggle comment current line
* <kbd>Ctrl</kbd><kbd>y</kbd><kbd>space</kbd> => Emmet expand in insert mode

...and a LOT of other shortcuts are waiting for you in [vimrc](https://github.com/leonapoleon/vimrc/blob/master/init.vim)!
