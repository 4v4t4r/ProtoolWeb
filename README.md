#  :octocat: ProtoolWeb CTF Web Based Tool
Protoolweb é uma ferramenta que está sendo desenvolvida para ajudar e facilitar na exploração de aplicações online nos campeonatos de Capture The Flag, vulgo CTF ou Hackaflag.

Como ainda estamos na versão 1.0, espero receber sugestões de mais funções para implementar o programa!

#  :wrench: Funções

- **Buscar por strings em todos os arquivos na pasta**

*Ex:*

`./ProtoolWeb.sh -P flag`


- **Buscar por Base64 em toda a pagina e alto decodar**

Função feita para automatizar uma busca por strings criptografadas em Base64.

*Ex:*

`./ProtoolWeb.sh -b64 https://whiteboyz.xyz/bts.js`

Você também pode buscar por Base64 em todos os arquivos existentes nas pasta utilizando:

`./ProtoolWeb.sh -b64=local` o parametro `local` NÃO deve ser alterado.

Pode ser bem útil se usada junto com a função `--clone`

- **Clonar Site**

Esta função serve para clonar todo o site que será analisado.

*Ex:*

`./ProtoolWeb.sh --clone https://whiteboyz.xyz/`


- **BruteForce via GET**

Função feita para testar sequências de números ou palavras passadas via GET no desafio. Muitos desafios CTF Web exigem algo parecido.

*Ex:*

`./ProtoolWeb.sh -pin https://whiteboyz.xyz/flag.php?flag= -n` O `-pin` Significa requisitar só o pin.

> Usar Wlist? y/n > 

Caso NÃO queira usar WordList selecione `n`

> ini >

Representa o numero inicial do teste, exemplo `1`

> fim >

Representa o numero final do teste, exemplo `100`

- **BruteForce via GET converter requisição em MD5**

`./ProtoolWeb.sh -pin https://whiteboyz.xyz/md5.php?flag= -md5`

- **BruteForce via GET setando cookie**

Para fazer requisição com Cookies:

*Ex:*

`./ProtoolWeb.sh -pinC https://whiteboyz.xyz/flag.php?flag= -ck SEUCOOKIE`

Para fazer requisição com cookies e converter em md5:

`./ProtoolWeb.sh -pinC https://whiteboyz.xyz/md5.php?flag= -md5 SEUCOOKIE`
