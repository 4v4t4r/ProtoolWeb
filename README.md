#  :octocat: ProtoWeb CTF Web Based Tool
Protoweb é uma ferramenta que está sendo desenvolvida para ajudar e facilitar na exploração de aplicações online nos campeonatos de Capture The Flag, vulgo CTF ou Hackaflag.

Como ainda estamos na versão 1.0, espero receber sugestões de mais funçes para implementar o programa!

#  :wrench: Funções

**Buscar por strings em todos os arquivos na pasta**

*Ex:*

`./ProtoWeb.sh -P flag`


- **Buscar por Base64 em toda a pagina e alto decodar**

Função feita para altomatizar uma busca por strings criptografadas em Base64.

*Ex:*

`./ProtoWeb.sh -b64 https://whiteboyz.xyz/bts.js`

Você também pode buscar por Base64 em todos os arquivos exixtentes nas pasta utilizando:

`./ProtoWeb.sh -b64=local` o parametro `local` NÃO deve ser alterado.

Pode ser bem útil se usada junto com a função `--clone`

- **Clonar Site**

Esta função serve para clonar todo o site que será analisado.

*Ex:*

`./ProtoWeb.sh --clone https://whiteboyz.xyz/`


- **BruteForce via GET**

Função feita para testar sequencias de números ou palavras passadas via GET no desafio. Muitos desafios CTF Web exigem algo parecido.

*Ex:*

`/ProtoWeb.sh -pin https://whiteboyz.xyz/flag.php?flag= -n` O `-pin` Significa requisitar só o pin.

> Usar Wlist? y/n > 

Caso NÃO queira usar WordList selecione `n`

> ini >

Representa o numero inicial do teste, exemplo `1`

> fim >

Representa o numero final do teste, exemplo `100`

- **BruteForce via GET converter requisição em MD5**

`./ProtoWeb.sh -pin https://whiteboyz.xyz/md5.php?flag= -md5`

- **BruteForce via GET setando cookie**

Para fazer requisição com Cookies:

*Ex:*

`./ProtoWeb.sh -pinC https://whiteboyz.xyz/flag.php?flag= -ck SEUCOOKIE`

Para fazer requisição com cookies e converter em md5:

`./ProtoWeb.sh -pinC https://whiteboyz.xyz/md5.php?flag= -md5 SEUCOOKIE`
