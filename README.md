# hpc_ssh_multiplexing

[![DOI](https://zenodo.org/badge/1187487539.svg)](https://doi.org/10.5281/zenodo.19139239)

Automation script to configure local SSH multiplexing for macOS and Linux/WSL users.

## The Problem it Solves
When working with High-Performance Computing (HPC), frequent data transfers and interactive connections usually require repeated typing of passwords and 2FA tokens. This script configures your local SSH client to smartly reuse secure connections.

## Features
- Configures secure rules directly in your `~/.ssh/config`.
- Keeps an active SSH "tunnel" in the background for 180 minutes after the first successful authentication.
- Eliminates repeated password prompts during lengthy bioinformatics or data science routines.

## 🛠️ Installation

To install and use the tool as a native system command, simply clone the repository and run our automated installation script. 

You can download it anywhere on your machine (like the `Downloads` folder), as the installer will handle the rest. Open your terminal and run the commands below:

```bash
# 1. Clone the repository
git clone https://github.com/thiagoparentefiocruz/hpc_ssh_multiplexing.git

# 2. Enter the cloned directory
cd hpc_ssh_multiplexing

# 3. Run the installer
bash install.sh
```

*(The `install.sh` script will securely copy the executable to `~/.local/bin` and automatically configure your `PATH` if necessary).*

**Cleanup (Optional):**
Since the installer makes a physical copy of the file, you can delete the downloaded folder right after installation to keep your computer organized:

```bash
cd ..
rm -rf hpc_ssh_multiplexing
```

## 📖 Usage

After installation, the tool will be globally available in any terminal. Just type the command below:

```bash
hpc_ssh_multiplexing
```
