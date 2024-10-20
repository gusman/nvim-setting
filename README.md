# Requirements: 

## Tool
* ripgrep
* fd
* luarock
* C compiler
* make

## Windows specific
* Install VS Code builtools, with following optional packages must be installed
  - MSVC v143
  - C++ CMake
* Install LLVM Clang using winget
* Make LLVM bin directory exist in PATH
* Install ripgrep using winget
* Change `telescope-fzf-native` extension build using Cmake for Windows
* Execute nvim and lazy in developer terminal and ensure all plugins are installed
* Make `libfzf.dll` is copied/located at `$HOME\Local\nvim-data\lazy\telescope-fzf-native.nvim\build`,
    `libzf.dll` can be found at `$HOME\Local\nvim-data\lazy\telescope-fzf-native.nvim\build\release`

## LSP
* python3-lsp for python
* gopls for golang


