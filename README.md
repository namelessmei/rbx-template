# RBX-Game Template

Roblox game template with darklua and makefile.

## Setup & Installation

### Prerequisites
- [Aftman](https://github.com/rojo-rbx/rokit) - Package manager
- [Rojo](https://github.com/rojo-rbx/rojo) - Build tool
- [VSCode Luau LSP](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.luau-lsp) - Language support

### Installing Dependencies
Choose one:
1. Run these commands:
```bash
aftman install
wally install
```

2. Or use the install script:
- Navigate to `tools/scripts`
- Right click `install.sh` and run it

3. Run Makefile:
```bash
make config
```

### Building the Place File
- Navigate to `tools/scripts`
- Right click `build.sh` and run it

## Project Structure

### Core
- `client/` - Client-side game code
- `server/` - Server-side game code
- `shared/` - Code shared between client and server
- `modules/` - Core reusable modules
- `ui/` - User interface components

### Development
- `.dev/` - Development configurations
- `assets/` - Game assets and resources
- `benches/` - Performance benchmarks
- `build/` - Build artifacts
- `tests/` - Test suites
- `tools/` - Build and development tools

### Documentation
- `docs/`
  - `api/` - Module APIs
  - `sys/` - System documentation

### Config Files
- `.darklua.json` - Darklua config
- `.github/` - GitHub workflows
- `.luaurc` - Luau config
- `.vscode/` - VSCode settings
- `build.project.json` - Rojo build settings
- `default.project.json` - Default Rojo settings
- `wally.toml` - Dependencies
- `Makefile` - Build automation
