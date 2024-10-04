# 🛵 I'm Mottu Mobile 🛵

## Sobre a solução deste projeto

Este projeto foi construído como parte do processo de entrevistas para a Mottu. Nos dois vídeos seguintes são apresentados:

1. [A versão iOS](https://www.loom.com/share/4f31b0757dc64b19b39eb32920f05231), com os seguintes requisitos funcionais: splash screen, listagem de personagens, busca por personagens, detalhes dos personagens, e cache, além da feature adicional de dar suporte a Light e Dark modes;

2. [A versão Android](https://www.loom.com/share/f4f5e74aa20c414586ed9b13241da64c), com o requisito de obter informações sobre a conectividade usando Kotlin e Event Channel;

3. Todas as atividades realizadas podem ser verificadas nesta [issue](https://github.com/thiagobrunoms/im-mottu-mobile/issues/20). Para mais detalhes, verifique as demais issues e milestone para analisar a forma que as atividades foram organizadas;

4. A última versão deste projeto está nas branches `main`e `level_3`.

## Solução baseada em package

Este projeto utiliza o pacote [`melos`](https://pub.dev/packages/melos) para gerenciar múltiplos pacotes dentro de um único repositório. O **Melos** facilita a administração de projetos Flutter/Dart compostos por diversos pacotes. Ele automatiza tarefas comuns, como a execução de scripts, a verificação de dependências e a publicação de pacotes. Isso permite uma gestão mais eficiente e organizada dos repositórios. No projeto Mottu - Marvel, todos os pacotes se encontram na pasta `/packages`. O aplicativo <em>flutter</em> encontra-se na pasta `/apps/mottu_marvel`. Observe que cada pacote possui seu próprio conjunto de dependências e pode ser desenvolvido e testado de forma independente. Utilize os comandos do `melos` disponíveis no `melos.yaml` para executar tarefas comuns, como a verificação de dependências e a execução de testes (mais detalhes abaixo).

## Executando o aplicativo

Para executar este aplicativo, ative o `melos` através do comando `dart pub global activate melos` e, em seguida, na raíz do projeto, execute `melos install`. Neste momento, apenas os pacotes e as dependências foram criadas. Para executar o aplicativo, considere a pasta `app/mottu_marvel`.

**Flavors e variáveis de ambientes**:

- O aplicativo Mottu Marvel suporte diferentes flavors/schemes: `dev`, `staging`, e `prod` (mais detalhes a seguir);

- Algumas variáveis de ambientes estão disponíveis no arquivo `app/mottu_marvel/.env.template`. Faça uma cópia deste arquivo, edit para `.env`, e adicione os seus valores das variáveis de ambiente. Usei esta abordagem para facilitar a avaliação deste prpjeto por parte do time Mottu. Uma outra abordagem que poderíamos considerar é usar o serviço do Firebase `remote config`. Entretanto, não seria tão "simples" o time Mottu avaliar este projeto.

**Executando o projeto**

- Para executar este projeto, na pasta `apps/mottu_marvel`, execute o seguinte comando: `flutter run -d [DEVICE_ID] --flavor staging`. Para esta versão, apenas a versão `staging` foi configurada.

**Executando testes unitários**

- No melos.yaml, há um script chamada fast_test. Execute `melos fast_test`.

- A segunda opção é realizar os testes individuais nas respecticas pastas `/test` de cada package e do app. Há testes no `/test` do projeto `/apps/mottu_marvel` e alguns testes em `packages` individuais. Execute `flutter test nome_test.dart` para executar um teste individual.

### Teste prático para desenvolvedores Mobile Mottu

> _Este teste está separado em 3 níveis de dificuldade. Você pode desenvolver seu teste APP atendendo apenas a um nível, ou a todos._
>
> **Para todos os níveis você deve executar algumas etapas iniciais:**
>
> - Fazer um **fork** deste repositório para o seu Github, de forma **privada**, e adicionar os usuarios `@brunosmm`, `@BetoMottu`, `@moreirawebmaster`,`@jeanchrocha`.
> - Criar um projeto Flutter com a seguinte configuração de package: `com.mottu.marvel`.
> - Criar uma conta de desenvolvedor em `developer.marvel.com`.
> - Gerar uma **API KEY** no site de desenvolvedor da **Marvel**, e consumir suas respectivas **API's**.
> - Criar um readme marcando os itens feitos.
> - Buildar para plataforma iOS.
>
> **Sugestões:**
>
> - Não faça apenas um commit com toda sua implementação.
> - Realize os commits em branchs separadas e utilize PRs.
> - Seja criativo(a) na sua implementação.
> - Não faça **Ctrl+C / Ctrl+V** de outro repositório !!!
> - Não utilize IA para criar seu código, nós vamos perceber!!!

# NÍVEL 1 - nome da branch (level_1):

- Executar etapas iniciais;
- Mostrar a listagem dos personagens (imagem e nome);
- Ação de clique nos cards da listagem e exibir os detalhes (imagem, nome e descrição);

# NÍVEL 2 - nome da branch (level_2):

- Executar etapas iniciais;
- Guardar em cache as consultas realizadas na API Marvel;
- Mostrar a listagem dos personagens (imagem e nome);
- Criar um filtro para a listagem;
- Ação de clique nos cards da listagem e exibir os detalhes (imagem, nome, descrição e personagens relacionados);

# NÍVEL 3 - nome da branch (level_3):

- Executar etapas iniciais;
- Criar uma Splashscreen customizada;
- Guardar em cache as consultas realizadas na API Marvel;
- Limpar cache de consultas no fechamento do APP;
- Mostrar a listagem dos personagens (imagem e nome);
- Criar um filtro para a listagem;
- Ciar uma paginação da listagem;
- Ação de clique nos cards da listagem e exibir os detalhes (imagem, nome, descrição e personagens relacionados);
- Ação de clique nos personagens relacionados e exibir os detalhes (imagem, nome, descrição e personagens relacionados);
- Criar testes de unidade das regras de negócio;

# Pontos extras (opcional):

- Utilizar Getx.
- Configurar Firebase crashlytics.
- Criar channel em kotlin, capturar a mudança de conexão, e mostrar uma mensagem de offline no flutter.
- Criar em alguma arquitetura(MVC, MVVM, MVP, MVU)
