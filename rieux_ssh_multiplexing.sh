#!/bin/bash

rieux_ssh_multiplexing() {
    echo "🚀 Iniciando configuração da Multiplexação SSH..."

    # 1. Definir caminhos
    local SSH_DIR="$HOME/.ssh"
    local SOCKETS_DIR="$SSH_DIR/sockets"
    local CONFIG_FILE="$SSH_DIR/config"

    # 2. Criar diretórios com as permissões corretas
    mkdir -p "$SOCKETS_DIR"
    chmod 700 "$SSH_DIR"
    chmod 700 "$SOCKETS_DIR"

    # 3. Criar o arquivo de configuração se não existir
    touch "$CONFIG_FILE"
    chmod 600 "$CONFIG_FILE"

    # 4. Checar se já está configurado
    if grep -q "ControlMaster" "$CONFIG_FILE"; then
        echo "✅ A multiplexação SSH já parece estar configurada no seu $CONFIG_FILE."
        echo "Nenhuma alteração foi feita."
    else
        echo "⚙️ Adicionando regras ao arquivo de configuração..."
        
        cat >> "$CONFIG_FILE" << 'EOF'

# --- Início da configuração de Multiplexação SSH ---
# Reaproveita conexões ativas para evitar múltiplos pedidos de senha/2FA
Host *
    ControlMaster auto
    ControlPath ~/.ssh/sockets/%r@%h-%p
    ControlPersist 180m
# --- Fim da configuração ---
EOF

        echo "---------------------------------------------------"
        echo "🎉 SUCESSO! Multiplexação configurada."
        echo "A conexão ficará ativa em segundo plano por 180 minutos (180m)."
    fi
}

rieux_ssh_multiplexing
