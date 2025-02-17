# Neovim

A scratch made config.

- Leader = Space

### Keys

##### Telescope

| Keymap   | Description  | Modes |
| -------- | ------------ | ----- |
| Ctrl p   | Find Files   | n     |
| Leader f | File Browser | n     |
| Leader k | Keymaps      | n     |
| Leader b | Buffers      | n     |
| Leader s | Grep Search  | n     |
| Leader d | Diagnostics  | n     |

##### Buffers

| Keymap    | Description     | Modes |
| --------- | --------------- | ----- |
| Leader xd | Close Buffer    | n     |
| Leader cb | Cleanup Buffers | n     |

##### Toggle

| Keymap   | Description | Modes |
| -------- | ----------- | ----- |
| Leader w | Toggle Wrap | n     |
| Leader l | Toggle List | n     |
| Ctrl \   | ToggleTerm  |       |
| Leader e | Neotree     | n     |
| "-"      | Oil         | n     |
| Leader g | Lazygit     | n     |
| Leader u | Update      | n     |

##### Folding

| Keymap | Description                 | Modes |
| ------ | --------------------------- | ----- |
| zR     | Open All Folds              | n     |
| zM     | Close All Folds             | n     |
| zr     | Open All Folds except Kinds | n     |
| zm     | Close All Folds             | n     |

##### LSP

| Keymap   | Description          | Modes |
| -------- | -------------------- | ----- |
| Leader r | LSP Rename           |       |
| K        | LSP Hover            | n     |
| gd       | Goto Definition      | n     |
| gD       | Goto Declaration     | n     |
| gi       | Goto Implementation  | n     |
| go       | Goto Type Definition | n     |
| gr       | Get References       | n     |
| gs       | Get Signature Help   | n     |
| ga       | Get Code Actions     | n     |
| gi       | Get Inlay Hints      | n     |
| gn       | Rename Symbol        | n     |

### Fix for errors

if getting a lua treesitter error in telescope run :TSInstall! lua
