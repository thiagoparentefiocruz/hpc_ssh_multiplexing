# rieux_ssh_multiplexing

Script de automação para configurar a multiplexação SSH local para usuários macOS e Linux/WSL.

## O problema que resolve
Ao trabalhar com HPC, transferências de dados e conexões interativas frequentes exigem a digitação repetida de senha e token 2FA. Este script configura o cliente SSH para reaproveitar conexões seguras.

## Funcionalidades
- Configura regras seguras no `~/.ssh/config`.
- Mantém um "túnel" SSH ativo em segundo plano por 180 minutos após a primeira autenticação.
- Elimina prompts repetidos de senha durante rotinas de bioinformática.

## 🛠️ Instalação

Para instalar e usar a ferramenta como um comando nativo do seu sistema, basta clonar o repositório e rodar o nosso script de instalação automatizada. 

Você pode baixar em qualquer diretório da sua máquina (como a pasta `Downloads`), pois o instalador cuidará de tudo. Abra seu terminal e rode os comandos abaixo:

```bash
# 1. Clone o repositório
git clone [https://github.com/thiagoparentefiocruz/rieux_ssh_multiplexing.git](https://github.com/thiagoparentefiocruz/rieux_ssh_multiplexing.git)

# 2. Entre na pasta clonada
cd rieux_ssh_multiplexing

# 3. Execute o instalador
bash install.sh
```

*(O script `install.sh` copiará o executável de forma segura para `~/.local/bin` e configurará automaticamente o seu `PATH`, caso seja necessário).*

**Limpeza (Opcional):**
Como o instalador faz uma cópia real do arquivo, logo após a instalação você pode apagar a pasta que acabou de baixar para manter seu computador organizado:

```bash
cd ..
rm -rf rieux_ssh_multiplexing
```

## 📖 Como Usar

Após a instalação, a ferramenta estará disponível globalmente em qualquer terminal. Basta digitar o comando abaixo:

```bash
rieux_ssh_multiplexing
```
