# Ubuntu 20.04 Post-Installation

Um Shell Script automático de pós instalação do Ubuntu 20.04 LTS e seus derivados. Você poderá usar esse script para instalar seus programas e aplicativos favoritos e fazer suas alterações no sistema.

![Bash](https://static.prasadt.com/logo64/bash.png)

### 📋 Pré-requisitos
Para baixar o script você irá precisar do pacote `git` instalado em sua máquina. Para instalá-lo, abra um shell e rode:

```
sudo apt update
sudo apt install git
```

### 🔧 Baixando e utilizando
Para baixar o script você precisará clonar este respositório. Para isso, rode o seguinte:
```
git clone https://github.com/VanillasC/post-install.git
```
Como alternativa, você pode [baixar](https://github.com/VanillasC/post-install/releases/download/v0.1.1/start.sh) diretamente o script.

Para rodar o script em sua máquina e iniciar a instalação:
```
sudo ./start.sh
```

### ⚙️ Acrescentando funções e apps
Acrescentar funções adicionais é fácil ao editar uma das pré-incluidas, simplesmente mude as variáveis de acordo com os ajustes que deseja fazer.

## 📄 Licença

Este projeto está sob a licença GNU General Public License v3.0 - veja o arquivo [LICENSE.md](https://github.com/VanillasC/post-install/blob/main/LICENSE) para detalhes.
