# Movie Challenge
***OBS:*** Apesar de todo o código, documentação e comentários deste projeto estarem em inglês, o README está em  português para melhor entendimento dos programadores da empresa que pediu o desafio.

<p align="center">
  <img src="https://raw.githubusercontent.com/Pablo-Raphael/images/main/movieChallenge.jpg"/>
</p>

---
#### Apesar de o desafio ter pedido apenas uma réplica estática, optei por, além de concluir os pontos do desafio, inserir algumas outras funçôes que tornam o aplicativo _totalmente funcional_☑️:
- O usuário pode navegar para __qualquer filme__ da lista de sugestões, já que os filmes similares exibidos abaixo do filme em destaque são clicáveis.
- O botão de like é persistente, não importa quantas vezes o app seja reiniciado, a escolha do usuário será guardada. 💾
- Como é possível navegar entres filmes e os likes são persistentes para qualquer filme, caso haja filmes favoritados na lista de sugestão, um símbolo de coração será mostrado ao lado do filme sugerido. ♥
- O botão de voltar, que fica sobre o banner do filme, também é funcional, caso o usuário esteja navegando entre filmes, esse botão permite voltar para o filme anterior.
- O aplicativo possui um ícone próprio, não o padrão do Flutter.
- Banners de filmes ao serem carregados surgem com um efeito de Fade-In.
---

#### Especificações do projeto:
- O projeto foi feito usando a versão mais recente do Dart(2.17.3), porém é provável que funcione em versões anteriores sem problemas.
- Os commits feitos no GitHub foram nomeados com base na convenção [ConventionalCommits](https://www.conventionalcommits.org/pt-br/v1.0.0-beta.4/).
- Para gerenciamento de estado de todo o projeto, utilizei o __BLoC__.
- Para guardar os dados de forma persistente, utilizei o __Shared Preferences__.
- Para requisições, utilizei a biblioteca [http](https://pub.dev/packages/http) do Flutter.
- Foram usadas 2 fontes e 2 ícones externos.
