
# 🛵 I'm Mottu Mobile 🛵

# NÍVEL 3 - nome da branch (level_3):
[x] Executar etapas iniciais;
[x] Criar uma Splashscreen customizada;
[x] Guardar em cache as consultas realizadas na API Marvel;
[x] Limpar cache de consultas no fechamento do APP;
[x] Mostrar a listagem dos personagens (imagem e nome);
- Criar um filtro para a listagem;
- Ciar uma paginação da listagem;
- Ação de clique nos cards da listagem e exibir os detalhes (imagem, nome, descrição e personagens relacionados);
- Ação de clique nos personagens relacionados e exibir os detalhes (imagem, nome, descrição e personagens relacionados);

> Ao final de cada etapa, criar PR para a branch **main** e realizar o merge.

# Extra branch
- Página de "login"
- Página home com visão dos personagens, quadrinhos e carosseu animado

# Pontos extras (opcional):
- Utilizar Getx.
- Configurar Firebase crashlytics.
- Criar channel em kotlin, capturar a mudança de conexão, e mostrar uma mensagem de offline no flutter.




Estrutura do Projeto

Este projeto Flutter utiliza uma estrutura organizada em três pastas principais: context, core e routes. Cada uma dessas pastas tem um papel específico para garantir a modularidade, reutilização de código e a separação de responsabilidades. A seguir, detalharei a função de cada uma dessas pastas e seus respectivos subdiretórios.

Estrutura Geral
- lib
  - context
  - core
  - routes


Context

A pasta context armazena os diferentes contextos do aplicativo. Cada contexto representa uma funcionalidade ou módulo específico do aplicativo, como autenticação (auth), produtos (product), etc. Dentro de cada contexto, os arquivos são organizados em subdiretórios para manter a separação de responsabilidades.

Exemplo de Estrutura para o Contexto auth  
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

api

Contém os arquivos responsáveis por se comunicar com o backend. Exemplo: auth_api.dart.

binding

Contém os arquivos responsáveis pela injeção de dependências para o contexto. Exemplo: auth_binding.dart.

controller

Contém os arquivos responsáveis pela lógica de negócios e gerenciamento de estado das páginas. Exemplo: login_controller.dart, register_controller.dart.

model

Contém os modelos de dados usados apenas pelo contexto específico. Exemplo: user_model.dart.

pages

Contém as páginas do contexto específico. Exemplo: login_page.dart, register_page.dart.




Core

A pasta core armazena os componentes e serviços compartilhados entre diferentes contextos do aplicativo. Isso inclui widgets reutilizáveis, serviços auxiliares, temas e utilitários. Essa pasta é a exencia da estrutura da empresa, caso a empresa crie um novo sistema, essa pasta garante a padronização dos componentes, estruturas de dados, conexões, converções, validações e outros...

Estrutura do Core
- lib
  - core
    - components
    - services
    - themes
    - util

components

Contém widgets reutilizáveis que podem ser usados em várias partes do aplicativo. Exemplo: app_card.dart.

services

Contém serviços compartilhados que fornecem funcionalidades auxiliares ou regras de negócios. Exemplo: app_services_conversor.dart.

class AppServicesConversor {
  static DateTime convertStringToDate(String data) {
    DateTime? dataLocal = DateTime.tryParse(data);
    return dataLocal!;
  }
}

themes

Contém definições de temas e estilos, como cores e fontes, que são usadas em todo o aplicativo.

util

Contém utilitários e funções auxiliares, como listas, enums e URLs.




Routes

A pasta routes armazena a configuração das rotas do aplicativo. Cada página do aplicativo é registrada aqui, junto com os bindings necessários para injeção de dependências.





Esta estrutura foi projetada para ser modular e escalável, permitindo que diferentes contextos do aplicativo sejam desenvolvidos de forma isolada e com fácil manutenção. A separação clara entre contextos, componentes compartilhados e configuração de rotas facilita o desenvolvimento e a adição de novas funcionalidades ao projeto.