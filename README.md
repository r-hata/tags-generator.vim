# tags-generator.vim
Tags-generator is a plugin for asynchronous execution of ctags command for neovim / Vim8.

## Requirements
- Vim 8.0 or above or Neovim.
- `ctags` command in $PATH

## Install
For vim-plug

```viml
Plug 'r-hata/tags-generator.vim'
```

## Usage
The plugin has only one command.

### `:GenerateTags`

## Configuration
Tags-generator can do you to specify options for executing ctags.

### `tags_command`
- Default: `ctags -R`

    This command is used for main `tags` generation.

```viml
let g:tags_command = '{CTAGS} -R {OPTION} {DIRECTORY}'
```
