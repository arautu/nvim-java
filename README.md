Neovim como IDE para Java
=========================

Montagem de uma IDE para Java usando os recursos recentes do Neovim 0.11.


## LSP

Para mais detalhes sobre a nova forma de configuração do LSP, veja no próprio neovim, `help lsp-quickstart` ou [neovim-lsp](https://neovim.io/doc/user/lsp.html "LSP"). Há também um ótimo artigo de [Gregory Anders](https://gpanders.com/blog/whats-new-in-neovim-0-11/ "What's New in Neovim 0.11").


## JDTLS

[JDTLS](https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki "eclipse.jdt.ls wiki") é um LSP (Language Server Protocol), para Java, chamado **eclipse.jdt.ls**. Foi usado o plugin [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) para configuração do cliente nativo do nvim com o servidor. O trabalho de [LukeElrod](https://github.com/LukeElrod/nvim/tree/master) serviu de consulta para a configuração do nvim-jdtls, embora ele use o plugin nvim-lspconfig. A fonte oficial do JDTLS encontra-se em: [Running the JAVA LS server from the command line](https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line).

Considerando a configuração adotada para o JDTLS neste trabalho, devemos tomar nota do seguintes pontos:
- Instale o servidor com o comando `MasonInstall jdtls`.
- JDTLS usa um workspace em `~/.local/share/nvim-java/jdtls-workspace`.
- Após a instalação do JDTLS com o Mason, JDTLS vai procurar pelo seguinte arquivo: `org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar` em `~/.local/share/nvim-java/mason/packages/jdtls/plugins` 
- Foi configurado o caminho para a JVM do Java 8. Para configurar outras versões de JVM, consulte em [JDTLS](https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki) os nomes corretos, procure no documento pela referência: *enum ExecutionEnvironment*.


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

```neovim
set ft=java
messages
LspInfo
checkhealth vim.lsp
```
1 Força o reconhecimento do arquivo aberto como java.
2 Permite verificar se o jdtls foi carregado corretamente.
3 Maneira mais detalhada de ver se o jdtls foi carregado corretamente.
4 Mesmo que LspInfo.



# Plugins instalados

* Lazy
* Mason
* jdtls-nvim
