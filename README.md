# ⚡ Azooz's LazyVim Config (Full-Stack Edition)

A highly customized **Neovim** configuration built on top of [LazyVim](https://www.lazyvim.org/).
Designed specifically for **Fedora Linux**, focusing on **.NET (C#)** backend and **Next.js (React)** frontend development.

## ✨ Features

* **Anime Dashboard:** Custom startup screen with "Azooz" ASCII art and quick actions.
* **Full .NET Suite:**
    * IntelliSense via `omnisharp` / `csharp_ls`.
    * Debugging support via `netcoredbg` (Breakpoints, stepping, variables).
    * One-key Build & Run (`<F5>`).
* **Modern Frontend:**
    * Tailwind CSS color previews.
    * Auto-closing tags for JSX/TSX.
    * Prettier formatting on save.
* **Project Management:** Custom Telescope integration to switch between Frontend/Backend repos instantly.
* **Visuals:** Smooth scrolling, Todo highlighting, and a clean UI.

## 🛠️ Prerequisites (Fedora)

Before cloning, ensure you have the necessary system tools installed:

```bash
# Core tools
sudo dnf install -y neovim git ripgrep fd-find gcc-c++

# Node.js (for Next.js & LSPs)
sudo dnf install -y nodejs

# .NET SDK (for C#)
sudo dnf install -y dotnet-sdk-8.0
```
## 🚀 Installation
Back up your existing configuration and clone this repo:
```bash
# Backup
mv ~/.config/nvim ~/.config/nvim.bak

# Clone
git clone [https://github.com/Aziz-Hubs/neovim-config.git](https://github.com/Aziz-Hubs/neovim-config.git) ~/.config/nvim

# Start Neovim
nvim
```
Note: On the first launch, Lazy.nvim will automatically download all plugins. Restart Neovim once the installation completes.
## ⌨️ Keymaps Cheatsheet
## 📂 Structure
``` lua/config/```: Core LazyVim options and keymaps.

``` lua/plugins/azooz-workstation.lua```: The core "Master" config (Dashboard, Projects, Debugger).

``` lua/plugins/nice-to-haves.lua```: UI enhancements (Tailwind colors, Auto-tag, Smooth scroll).

# Clipboard support (Wayland)
sudo dnf install -y wl-clipboard
