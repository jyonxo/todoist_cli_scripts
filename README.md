# todoist_cli_scripts

A set of shell scripts to make Todoist CLI commands easier to use on macOS and Windows.

## Requirements

- macOS (OSX) or Windows
- [todoist-cli](https://github.com/sachaos/todoist) installed

### Installation

Install todoist-cli using Homebrew (macOS):

```sh
brew install todoist-cli
```

On Windows, download the binary from the [releases page](https://github.com/sachaos/todoist/releases) and add it to your PATH.

When running the first command, you will be prompted for your Todoist API key.  
You can obtain your API key from the developer section of your Todoist account.

https://todoist.com/prefs/integrations

## Shell Script Setup (macOS/Linux)

To use these scripts, you need to source them in your shell configuration file, such as `~/.bashrc`, `~/.zshrc`, etc., depending on your setup.

Example:

```sh
source /path/to/todoist_cli_scripts.sh
```

## Windows Setup

For Windows, use the provided `task.bat` to call the PowerShell script `task.ps1`.  
Place both `task.bat` and `task.ps1` in a folder included in your system PATH, 
not forgetting to include the windows binary to todoist.exe

Example usage from Command Prompt or PowerShell:

```bat
task list
task sync
task delete 123456789
task project Work
task @ Home Buy milk
task Buy bread
```

This will call `task.ps1` via `task.bat` and pass all arguments to the PowerShell script.

## Usage

See comments and help in each script for usage instructions.

---

License: GNU GPL