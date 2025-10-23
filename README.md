Neovim como IDE para Java
=========================

Montagem de uma IDE para Java usando os recursos recentes do Neovim 0.11.


## LSP

Para mais detalhes sobre a nova forma de configuração do LSP, veja no próprio neovim, `help lsp-quickstart` ou [neovim-lsp](https://neovim.io/doc/user/lsp.html "LSP"). Há também um ótimo artigo de [Gregory Anders](https://gpanders.com/blog/whats-new-in-neovim-0-11/ "What's New in Neovim 0.11").


## JDTLS

Foi instalado o [JDTLS](https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki), como um servidor de LSP (Language Server Protocol), para Java, chamado **eclipse.jdt.ls** e o cliente nativo do Nvim. A configuração dos servidores ficou a cargo do pacote [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig). Para usá-lo, basta consultar o nome do servidor em nvim-lspconfig/lsp e habilitá-lo, conforme mostrado a seguir. Mais informações no [documento de configuração do JDTLS para o nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jdtls).

```lua
vim.lsp.enable({ "jdtls" })
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

Recarregar o arquivo init.lua

```neovim
so ~/.config/nvim-java/init.lua
```
