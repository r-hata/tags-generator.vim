# tags-generator.vim
Tags-generator is a plugin that asynchronous execute ctags / gtags command for neovim / Vim8.

## Requirements
- Vim 8.0 or above or Neovim.
- `ctags` command in `$PATH`
- `gtags` command in `$PATH` (optional support)

## Install
For vim-plug

```viml
Plug 'r-hata/tags-generator.vim'
```

## Usage
The plugin has the following commands.
See [Configuration](#configuration) for how to specify options.

- `:GenerateTags`
- `:GenerateGTAGS`

    This command can be used when gtags command is enabled.

## Key mapping
The following mapping is set for executing plugin's commands when `g:tags_generator#default_map` is 1.

```viml
nmap <Leader>t :GenerateTags<CR>
nmap <Leader>g :GenerateGTAGS<CR>
```

## Configuration
Tags-generator can specify options for executing ctags / gtags.

### `tags_command`
- Default: `ctags -R`

    This command is used for main `tags` generation.

    ```viml
    let g:tags_command = '{CTAGS} -R {OPTION} {DIRECTORY}'
    ```

### `gtags_command`
- Default: `gtags`

    This command is used for main `GTAGS` generation.

    ```viml
    let g:tags_command = '{GTAGS} {OPTION} {DIRECTORY}'
    ```
