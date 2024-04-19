### Shopcart - Flutter for Dart

Codificação em Flutter com Dart para aplicação de Carrinho de Compras usando Dart com Flutter que demonstra várias melhores práticas de programação para desenvolvimento de aplicativos móveis:

- Uso de Pacotes Externos: Importa os pacotes flutter/material.dart e provider/provider.dart para utilizar recursos do Flutter e do Provider, respectivamente.

- Inicialização do Aplicativo: A função main() inicia o aplicativo chamando runApp() com uma instância de MyApp.

- Classe MyApp: Esta classe herda de StatelessWidget e define o aplicativo Flutter. Usa o ChangeNotifierProvider para gerenciar o estado global do carrinho de compras e configura o tema do aplicativo.

- Classe ProductsOverviewScreen: Define a tela principal que exibe uma lista de produtos. Utiliza Scaffold para definir a estrutura básica da tela, AppBar para a barra de navegação superior e ListView.builder para construir a lista de produtos de forma eficiente.

- Classe CartScreen: Define a tela do carrinho de compras, que exibe os itens adicionados ao carrinho e o total. Usa Scaffold e AppBar para a estrutura básica, e ListView.builder para exibir a lista de itens do carrinho.

- Classe CreditCardPaymentScreen: Define a tela de pagamento com cartão de crédito. Utiliza Scaffold para a estrutura básica e TextFormField para coletar os detalhes do cartão. Também usa ElevatedButton para o botão de pagamento.

### Além disso, o código também segue outras práticas recomendadas, como:

- Divisão de Responsabilidades: Cada classe tem uma responsabilidade única, o que facilita a manutenção e a compreensão do código.
Utilização de Widgets e Recursos do Flutter: Usa uma variedade de widgets e recursos do Flutter para construir uma interface de usuário rica e responsiva.

- Gerenciamento de Estado: Utiliza o Provider para gerenciar o estado global do carrinho de compras de forma eficiente.

- Estilo e Temas Consistentes: Configura um tema global para manter a consistência visual em todo o aplicativo.
Essas práticas contribuem para um código limpo, organizado e fácil de manter, resultando em uma experiência de desenvolvimento mais eficiente e um aplicativo de alta qualidade.


### Conclusão

Esta aplicação em Dart para Flutter demonstra a implementação de um aplicativo simples de compras, onde os usuários podem visualizar uma lista de produtos, adicionar itens ao carrinho de compras e realizar o pagamento utilizando um cartão de crédito. Ao longo do código, foram aplicadas diversas melhores práticas de programação, incluindo a organização em classes, o uso de widgets do Flutter, o gerenciamento de estado com o Provider e a criação de uma interface de usuário intuitiva e responsiva.


### Desenvolvido por:
Emerson Amorim [@emerson-amorim-dev](https://www.linkedin.com/in/emerson-amorim-dev/)