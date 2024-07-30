
# 🛵 I'm Mottu Mobile 🛵

Para todos os níveis você deve executar algumas etapas iniciais:

- [x] Fazer um fork deste repositório para o seu Github, de forma privada, e adicionar os usuarios @brunosmm, @BetoMottu, @moreirawebmaster,@jeanchrocha.
- [x] Criar um projeto Flutter com a seguinte configuração de package: com.mottu.marvel.
- [x] Criar uma conta de desenvolvedor em developer.marvel.com.
- [x] Gerar uma API KEY no site de desenvolvedor da Marvel, e consumir suas respectivas API's.
- [x] Criar um readme marcando os itens feitos.
- [x] Buildar para plataforma iOS.
Sugestões:

- [x] Não faça apenas um commit com toda sua implementação.
- [x] Realize os commits em branchs separadas e utilize PRs.
- [x] Seja criativo(a) na sua implementação.
- [x] Não faça Ctrl+C / Ctrl+V de outro repositório !!!
- [x] Não utilize IA para criar seu código, nós vamos perceber!!!

# NÍVEL 3 - nome da branch (level_3):
- [x] Executar etapas iniciais;
- [x] Criar uma Splashscreen customizada;
- [x] Guardar em cache as consultas realizadas na API Marvel;
- [x] Limpar cache de consultas no fechamento do APP;
- [x] Mostrar a listagem dos personagens (imagem e nome);
- [x] Criar um filtro para a listagem;
- [x] Ciar uma paginação da listagem;
- [x] Ação de clique nos cards da listagem e exibir os detalhes (imagem, nome, descrição e personagens relacionados);
- [-] Ação de clique nos personagens relacionados e exibir os detalhes (imagem, nome, descrição e personagens relacionados);

> Ao final de cada etapa, criar PR para a branch **main** e realizar o merge.

# Extra branch
- [x] Página de "login"
- [x] Página home com visão dos personagens, quadrinhos e carosseu animado

# Pontos extras (opcional):
- [x] Utilizar Getx.
- [x] Configurar Firebase crashlytics.
- Criar channel em kotlin, capturar a mudança de conexão, e mostrar uma mensagem de offline no flutter.


# Explicações

Esta estrutura foi projetada para ser modular e escalável, permitindo que diferentes contextos do aplicativo sejam desenvolvidos de forma isolada e com fácil manutenção. A separação clara entre contextos, componentes compartilhados e configuração de rotas facilita o desenvolvimento e a adição de novas funcionalidades ao projeto.

Embora não seja um padrão formalmente documentado, sua estrutura é bastante próxima de algumas práticas recomendadas, como:

- Arquitetura MVC/MVVM: A separação entre controllers, models e views/pages é uma prática comum em arquiteturas como MVC (Model-View-Controller) e MVVM (Model-View-ViewModel).
- Arquitetura Modular: A ideia de dividir o aplicativo em módulos ou contextos separados é um princípio chave da arquitetura modular, que visa aumentar a flexibilidade e a escalabilidade do projeto.
- Clean Architecture: Alguns princípios da Clean Architecture, como a separação de camadas (dados, domínio e apresentação) e a inversão de dependências, são visíveis na sua abordagem.


# Estrutura do Projeto

Este projeto Flutter utiliza uma estrutura organizada em três pastas principais: context, core e routes. Cada uma dessas pastas tem um papel específico para garantir a modularidade, reutilização de código e a separação de responsabilidades. A seguir, detalharei a função de cada uma dessas pastas e seus respectivos subdiretórios.
### Estrutura Geral
```sh
- lib
  - context
    - splash
    - home
    - character
    - comics
    - details
  - core
    - components
    - biding
    - controller
    - themes
    - services
    - utils
  - routes
    - app_routes
    - app_pages
  - main
```

# 1 - Context

A pasta context armazena os diferentes contextos do aplicativo. Cada contexto representa uma funcionalidade ou módulo específico do aplicativo, como autenticação (auth), produtos (product), etc. Dentro de cada contexto, os arquivos são organizados em subdiretórios para manter a separação de responsabilidades.

Exemplo de Estrutura para o Contexto auth  
```sh
- lib
  - context
    - auth
      - api
        - auth_api.dart
      - binding
        - auth_binding.dart
      - controller
        - login_controller.dart
        - register_controller.dart
      - model
        - user_model.dart
      - pages
        - login_page.dart
        - register_page.dart
```
#### 1.1 - api

Contém os arquivos responsáveis por se comunicar com o backend. Exemplo: auth_api.dart.

#### 1.2 - binding

Contém os arquivos responsáveis pela injeção de dependências para o contexto. Exemplo: auth_binding.dart.

#### 1.3 - controller

Contém os arquivos responsáveis pela lógica de negócios e gerenciamento de estado das páginas. Exemplo: login_controller.dart, register_controller.dart.

#### 1.4 - model

Contém os modelos de dados usados apenas pelo contexto específico. Exemplo: user_model.dart.

#### 1.5 - pages

Contém as páginas do contexto específico. Exemplo: login_page.dart, register_page.dart.



# 2.0 - Core

A pasta core armazena os componentes e serviços compartilhados entre diferentes contextos do aplicativo. Isso inclui widgets reutilizáveis, serviços auxiliares, temas e utilitários. Essa pasta é a exencia da estrutura da empresa, caso a empresa crie um novo sistema, essa pasta garante a padronização dos componentes, estruturas de dados, conexões, converções, validações e outros...

Estrutura do Core
```sh
- lib
  - core
    - components
    - controller
    - biding
    - services
    - themes
    - util
```
#### 2.1 - components

Contém widgets reutilizáveis que podem ser usados em várias partes do aplicativo. Exemplo: app_card.dart.

#### 2.2 - services

Contém serviços compartilhados que fornecem funcionalidades auxiliares ou regras de negócios. Exemplo: app_services_conversor.dart.
```dart
class AppServicesConversor {
  static DateTime convertStringToDate(String data) {
    DateTime? dataLocal = DateTime.tryParse(data);
    return dataLocal!;
  }
}
```
#### 2.3 - themes

Contém definições de temas e estilos, como cores e fontes, que são usadas em todo o aplicativo.

#### 2.4 - util

Contém utilitários e funções auxiliares, como listas, enums e URLs.




# 3.0 - Routes

A pasta routes armazena a configuração das rotas do aplicativo. Cada página do aplicativo é registrada aqui, junto com os bindings necessários para injeção de dependências.



