Neovim como IDE para Java
=========================

Montagem de uma IDE para Java usando os recursos recentes do Neovim 0.11.


## LSP

Para mais detalhes sobre a nova forma de configuração do LSP, veja no próprio neovim, `help lsp-quickstart` ou [neovim-lsp](https://neovim.io/doc/user/lsp.html "LSP"). Há também um ótimo artigo de [Gregory Anders](https://gpanders.com/blog/whats-new-in-neovim-0-11/ "What's New in Neovim 0.11").


## JDTLS

Foi instalado o [JDTLS](https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki), como um servidor de LSP (Language Server Protocol), para Java, chamado **eclipse.jdt.ls** e para cliente, foi usado o [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), nativo do Nvim. Para a configuração do JDTLS, seguiu-se as orientação do [documento de configuração do JDTLS para o nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jdtls) e foi consultado também a [configuração pré-existente do JDTLS no nvim-lpsconfig](https://github.com/neovim/nvim-lspconfig/blob/master/lsp/jdtls.lua#L89).

Estas configurações colocam o workspace em `~/.cache/nvim-java/jdtls/workspace`.

Em `~\.bashrc` foi colocado a seguinte variável de ambiente.

```bash
export JDTLS_JVM_ARGS="-Xmx1g --add-modules=ALL-SYSTEM --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED"
```

### Teclas de atalho

As teclas de atalho e suas funções, detalhadas em [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls), estão funcionando automaticamente, sem qualquer configuração extra, graças ao [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig). No entanto, as teclas usada como atalhos são diferentes daquelas menciondas em nvim-jdtls. Mais detalhes sobre as teclas de atalho padrão para o LSP, encontra-se em `help lsp-quickstart`.

Abaixo, estão algumas das teclas de atalho disponíveis:
- "grn" -> renomeaar;
- "gra" -> *code action*;
- "grr" -> vá para a referência;
- "gri" -> vá para a implementação;
- "grt" -> vá para definição;
- "gO" -> lista todos os documentos que contém o símbolo;
- CTRL-S -> is mapped in Insert mode to |vim.lsp.buf.signature_help()|
- i_CTRL-X_CTRL-O -> autocompletar;
- CTRL-} (wsl), CTRL-] -> vá para definição;
- gq -> formatação;
- K -> Descrição, documentação da função ou método sob o cursor.


### Testar o LSP

Se quiser testar o LSP, mesmo sem ter um projeto em java, faça `set ft=java` e veja em `messages` ou `LspInfo`.

```neovim
set ft=java
messages
LspInfo
checkhealth vim.lsp
```
1 Força o neovim a reconhecer o arquivo como do tipo java.
2 Permite verificar se o jdtls foi carregado corretamente.
3 Maneira mais detalhada de ver se o jdtls foi carregado corretamente.
4 Mesmo que LspInfo.


# Debug

> Notes about debugging: the -agentlib: is for connecting a java debugger agent to the process, and if you wish to debug the server from the start of execution, set suspend=y so that the JVM will wait for your debugger prior to starting the server. [jdtls](https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki "eclipse.jdt.ls wiki")

# Lazy.nvim
[lazy.nvim](https://github.com/folke/lazy.nvim)

A configuração do Lazy.nvim se encontra no arquivo ~/.config/nvim/lua/configu/lazy.lua e seguiu basicamente a orientação da documentação oficial. [lazy.nvim]

## Plugins

Lazy.nvim irá procurar automaticamente os plugins declarados na pasta *~/.config/nvim/plugins* [lazy.nvim]

### lsp.lua
[mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim)
[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
[mason.nvim](mason-org/mason.nvim)

Em ~/.config/nvim/plugins/lsp.lua*, se encontram os plugins que facilitarão a instalação dos servidores de linguagens de prograação do LSP.

# Comandos importantes

```neovim
so ~/.config/nvim-java/init.lua
```
1 Recarregar init.lua

## LSP




# Plugins instalados

* Lazy
* Mason
* jdtls-nvim
