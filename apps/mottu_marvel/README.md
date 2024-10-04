# mottu_marvel

## Sobre a solução deste projeto

Este projeto foi construído como parte do processo de entrevistas para a Mottu. Nos dois vídeos seguintes são apresentados:

1. [A versão iOS](https://www.loom.com/share/4f31b0757dc64b19b39eb32920f05231), com os seguintes requisitos funcionais: splash screen, listagem de personagens, busca por personagens, detalhes dos personagens, e cache, além da feature adicional de dar suporte a Light e Dark modes;

2. [A versão Android](https://www.loom.com/share/f4f5e74aa20c414586ed9b13241da64c), com o requisito de obter informações sobre a conectividade usando Kotlin e Method Channel.

3. Todas as atividades realizadas podem ser verificadas nesta [issue](https://github.com/thiagobrunoms/im-mottu-mobile/issues/20). Para mais detalhes, verifique as demais issues e milestone para analisar a forma que as atividades foram organizadas.

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
