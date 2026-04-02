#!/bin/bash

hpc_ssh_multiplexing() {
    echo "🚀 Starting SSH Multiplexing setup..."

    # 1. Define paths
    local SSH_DIR="$HOME/.ssh"
    local SOCKETS_DIR="$SSH_DIR/sockets"
    local CONFIG_FILE="$SSH_DIR/config"

    # 2. Create directories with correct permissions
    mkdir -p "$SOCKETS_DIR"
    chmod 700 "$SSH_DIR"
    chmod 700 "$SOCKETS_DIR"

    # 3. Create the configuration file if it doesn't exist
    touch "$CONFIG_FILE"
    chmod 600 "$CONFIG_FILE"

    # 4. Check if it's already configured
    if grep -q "ControlMaster" "$CONFIG_FILE"; then
        echo "✅ SSH multiplexing already seems to be configured in your $CONFIG_FILE."
        echo "No changes were made."
    else
        echo "⚙️ Adding rules to the configuration file..."
        
        cat >> "$CONFIG_FILE" << 'EOF'

# --- Start of SSH Multiplexing configuration ---
# Reuses active connections to avoid multiple password/2FA prompts
Host *
    ControlMaster auto
    ControlPath ~/.ssh/sockets/%r@%h-%p
    ControlPersist 180m
# --- End of configuration ---
EOF

        echo "---------------------------------------------------"
        echo "🎉 SUCCESS! Multiplexing configured."
        echo "The connection will remain active in the background for 180 minutes (180m)."
    fi
}

hpc_ssh_multiplexing
