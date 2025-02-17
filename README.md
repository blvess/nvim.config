# Neovim

A scratch made config.

### Keys

##### Telescope

| Keymap    | Description  | Modes |
| --------- | ------------ | ----- |
| <C-p>     | Find Files   | n     |
| <leader>f | File Browser | n     |
| <leader>k | Keymaps      | n     |
| <leader>b | Buffers      | n     |
| <leader>s | Grep Search  | n     |
| <leader>d | Diagnostics  | n     |

##### Buffers

| Keymap     | Description     | Modes |
| ---------- | --------------- | ----- |
| <leader>xd | Close Buffer    | n     |
| <leader>cb | Cleanup Buffers | n     |

##### Toggle

| Keymap    | Description | Modes |
| --------- | ----------- | ----- |
| <leader>w | Toggle Wrap | n     |
| <leader>l | Toggle List | n     |
| <C-\>     | ToggleTerm  |       |
| <leader>e | Neotree     | n     |
| "-"       | Oil         | n     |
| <leader>g | Lazygit     | n     |
| <leader>u | Update      | n     |

##### Folding

| Keymap | Description                 | Modes |
| ------ | --------------------------- | ----- |
| zR     | Open All Folds              | n     |
| zM     | Close All Folds             | n     |
| zr     | Open All Folds except Kinds | n     |
| zm     | Close All Folds             | n     |

##### LSP

| Keymap    | Description          | Modes |
| --------- | -------------------- | ----- |
| <leader>r | LSP Rename           |       |
| K         | LSP Hover            | n     |
| gd        | Goto Definition      | n     |
| gD        | Goto Declaration     | n     |
| gi        | Goto Implementation  | n     |
| go        | Goto Type Definition | n     |
| gr        | Get References       | n     |
| gs        | Get Signature Help   | n     |
| ga        | Get Code Actions     | n     |
| gi        | Get Inlay Hints      | n     |
| gn        | Rename Symbol        | n     |

### Fix for errors

if getting a lua treesitter error in telescope run :TSInstall! lua
