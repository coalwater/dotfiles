# How to install

## Dependencies

- [Vundle][vundle]
  You need vundle to install the vim bundles, see [Installation instructions][vundle-installation]
- For [YouCompleteMe][you-complete-me] to work you need vim to be compiled with python support, for debian i found
  that the package [vim-nox][vim-nox] to have scripting languages builtin to it so you could remove vim and install
  vim-nox instead
- For ctags to work you need to install [exuberant-ctags][exuberant-ctags]

## Steps

1- Check the [vundle installation instructions][vundle-installation]
2- Place the .vimrc in your home, and open vim, then you could run `:PluginInstall` this way vundle will scan your
file for the defined bundles and install the missing bundles ( or all of them if none are installed )


[vundle]:https://github.com/gmarik/Vundle.vim
[vundle-installation]: https://github.com/gmarik/Vundle.vim#quick-start
[you-complete-me]: https://github.com/Valloric/YouCompleteMe
[vim-nox]: https://packages.debian.org/squeeze/vim-nox
[exuberant-ctags]: https://packages.debian.org/squeeze/exuberant-ctags
