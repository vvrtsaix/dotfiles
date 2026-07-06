# AGENTS.md

## Purpose
This repository is a Neovim configuration built on top of LazyVim.
Agents should treat it as a Lua config repo, not as an application or library.

Primary goals:
- keep startup stable
- prefer small, local changes
- follow LazyVim and lazy.nvim conventions
- extend defaults instead of replacing them unless intentional

## Repository Layout
Important files:
- `init.lua`
- `lua/config/lazy.lua`
- `lua/config/options.lua`
- `lua/config/keymaps.lua`
- `lua/config/autocmds.lua`
- `lua/plugins/`
- `stylua.toml`
- `lazy-lock.json`

Load flow:
- `init.lua` only requires `config.lazy`
- `lua/config/lazy.lua` bootstraps `lazy.nvim` and calls `require("lazy").setup(...)`
- `lua/plugins/*.lua` contains lazy.nvim plugin specs
- `lua/config/options.lua`, `keymaps.lua`, and `autocmds.lua` are the main local overrides

## Rule Files
Checked during analysis:
- no `.cursorrules`
- no files under `.cursor/rules/`
- no `.github/copilot-instructions.md`

If any are added later, treat them as additional repository instructions.

## Build, Lint, And Test Commands
There is no formal build step and no automated test suite in this repo.
Validation is mainly formatting Lua files and starting Neovim headlessly.

### Bootstrap / Sync Plugins
```sh
nvim --headless "+Lazy! sync" +qa
```
Use after changing plugin specs or after a fresh checkout.

### Startup Smoke Test
```sh
nvim --headless "+qa"
```
Fastest repo-level validation.

### Health Check
```sh
nvim --headless "+checkhealth" +qa
```
Use for tool, provider, or language-server issues.

### Format All Lua Files
```sh
stylua .
```

### Format A Single File
```sh
stylua lua/config/lazy.lua
```
Replace the path with the file you changed.

### Lint
No dedicated repo-local CLI lint command is configured.
Current evidence suggests:
- formatting is handled by `stylua`
- diagnostics mainly come from Neovim and `lua_ls`
- `nvim-lint` appears in `lazy-lock.json`, but no repo-local lint command is defined

Practical lint-like validation:
```sh
nvim --headless "+qa"
nvim --headless "+checkhealth" +qa
```

### Tests
No automated tests, test runner config, or test files were found.

Because of that:
- full test command: not applicable
- single test file command: not applicable
- single named test command: not applicable

Closest equivalent to a single fast validation run:
```sh
nvim --headless "+qa"
```

If a real test suite is added later, update this file with the full suite command and the single-test commands.

## Validation Expectations
After changes:
- run `stylua` on changed Lua files
- run `nvim --headless "+qa"`
- run `nvim --headless "+Lazy! sync" +qa` if plugin specs changed
- run `nvim --headless "+checkhealth" +qa` for tool, provider, or language-server changes

## File Responsibilities
- `init.lua`: keep it tiny; only bootstrap top-level config here
- `lua/config/lazy.lua`: bootstrap and top-level lazy.nvim setup; keep startup-safe
- `lua/config/options.lua`: local option overrides only
- `lua/config/keymaps.lua`: custom keymaps; include `desc` when useful
- `lua/config/autocmds.lua`: custom autocmds; prefer `vim.api.nvim_create_autocmd`
- `lua/plugins/*.lua`: plugin specs; prefer extending upstream config over replacing it

## Code Style
### Formatting
- use `stylua`
- indentation is 2 spaces
- target line width is 120 columns
- keep formatting stable rather than hand-aligning for style
- use `-- stylua: ignore` only when normal formatting materially hurts readability

### Imports / Requires
- use `require("module.path")`
- prefer local bindings for modules reused multiple times
- avoid aliases without a readability benefit
- keep requires near first use unless they are clear module-level dependencies

Example:
```lua
require("config.lazy")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
```

### Strings, Tables, And Functions
- prefer double quotes
- use trailing commas in multiline tables
- keep nested tables readable
- prefer direct table literals for plugin specs and option objects
- keep functions small and local when possible
- use inline callbacks when they remain readable
- extract helpers only when reuse or clarity justifies it

### Types And Naming
- preserve useful EmmyLua annotations such as `---@param`, `---@type`, and `---@class`
- add annotations when they materially improve editor support
- avoid noisy annotations everywhere
- module names should match file paths
- use short, descriptive local names
- prefer conventional names like `opts`, `keys`, `servers`, `buffer`, and `lazypath`

### Comments
- keep comments brief and useful
- explain non-obvious intent, not obvious syntax
- preserve comments that explain LazyVim or merge behavior
- avoid decorative banners and excessive narration

## LazyVim And lazy.nvim Conventions
Follow the patterns already present in the repo.

- use `{ import = "..." }` for LazyVim extras
- use `opts = function(_, opts) ... end` when extending existing config
- use `opts = { ... }` for small direct option tables
- use `dependencies = { ... }` only when setup actually requires it
- place custom plugin specs under `lua/plugins/`
- when extending arrays such as `ensure_installed`, prefer `vim.list_extend(...)`

## Error Handling
Match the startup-safe style in `lua/config/lazy.lua`.

- fail clearly when bootstrap code cannot continue
- show actionable startup errors with Neovim APIs
- avoid silent failure in bootstrap paths
- for fatal bootstrap errors: run the system command, check `vim.v.shell_error`, display the failure with `vim.api.nvim_echo`, then exit non-zero
- for non-fatal config code: prefer simple guards over defensive abstraction

## Editing Guidance For Agents
- inspect current LazyVim or plugin behavior before overriding it
- make the smallest working change
- avoid rewriting unrelated config
- do not restructure files without a concrete benefit
- keep plugin-specific logic in `lua/plugins/`
- avoid pushing plugin config into `init.lua`
- avoid duplicate keymaps and autocmds

## Things Not To Assume
Do not assume:
- there is a test framework
- there is a CI pipeline
- there is an app build step
- there are repo-local lint scripts
- there are extra rule files beyond this document

If new tooling or repo rules are added later, update this file to keep it accurate.
