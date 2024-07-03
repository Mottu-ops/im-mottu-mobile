
# Marvel Heroes App

Este projeto foi desenvolvido como parte do processo seletivo da Mottu. O objetivo do aplicativo é demonstrar habilidades em Flutter, utilizando diversas funcionalidades e integrações importantes, como gerenciamento de estado, armazenamento em cache, paginação, e integração com serviços nativos através de Kotlin e Swift, utilizando a API de characters, da Marvel.

## Funcionalidades Implementadas

1. **Splashscreen Customizada**:
   - Uma tela de splash personalizada que é exibida ao iniciar o aplicativo.

2. **Armazenamento em Cache das Consultas à API Marvel**:
   - As consultas realizadas à API Marvel são armazenadas em cache para melhorar a performance e a experiência do usuário.

3. **Limpeza do Cache no Fechamento do APP**:
   - O cache de consultas é limpo automaticamente quando o aplicativo é fechado.

4. **Ação de Clique nos Personagens e Exibição dos Detalhes**:
   - Os usuários podem clicar nos personagens listados para visualizar detalhes como imagem, nome e descrição(se houver).

5. **Listagem dos Personagens (Imagem e Nome)**:
   - Uma lista de personagens é exibida com suas respectivas imagens e nomes.

6. **Filtro para a Listagem**:
   - Um filtro foi implementado para que os usuários possam buscar personagens específicos.

7. **Paginação da Listagem**:
   - A listagem dos personagens possui paginação para carregar mais personagens conforme o usuário rola a tela.

8. **Utilização do GetX**:
   - GetX é utilizado para gerenciamento de estado, injeção de dependência e navegação, proporcionando uma estrutura limpa e reativa.

9. **Configuração do Firebase Crashlytics**:
   - O Firebase Crashlytics foi configurado para monitorar e relatar falhas do aplicativo.

10. **Canal de Comunicação em Kotlin e Swift para Monitorar Conexão**:
    - Um canal de comunicação foi criado tanto em Kotlin quanto em Swift para capturar mudanças na conexão de rede e exibir uma mensagem de offline no Flutter.

## Estrutura do Projeto

```plaintext
lib/
├── main.dart
├── src/
│   ├── common/
│   │   ├── configs.dart
│   │   ├── infrastructure/
│   │   │   ├── http/
│   │   │   │   ├── dio_http_adapter.dart
│   │   │   │   ├── http.dart
│   │   │   │   ├── token_interceptor.dart
│   │   │   │
│   │   │   ├── splash_view.dart
│   ├── home/
│   │   ├── controllers/
│   │   │   ├── character_controller.dart
│   │   ├── models/
│   │   │   ├── hero_dto.dart
│   │   │   ├── params_dto.dart
│   │   ├── repositories/
│   │   │   ├── characters_repository.dart
│   │   │   ├── i_characters_repository.dart
│   │   ├── views/
│   │   │   ├── splash_view.dart
│   │   │   ├── characters_view.dart
│   │   │   ├── hero_detail_view.dart
```

## Requisitos

- Flutter SDK (>=v3.22.2)

## Como Executar

1. **Clone o Repositório**:
   ```bash
   git clone https://github.com/seu-usuario/marvel-heroes-app.git
   cd marvel-heroes-app
   ```

2. **Instale as Dependências**:
   ```bash
   flutter pub get
   ```

3. **Execute o Aplicativo**:
   ```bash
   flutter run
   ```

## Testes

Os testes unitários foram configurados utilizando o `flutter_test` e `mockito`. Para executar os testes, utilize o comando:

```bash
flutter test
```

## Contribuição

Sinta-se à vontade para contribuir com melhorias, abrindo issues ou enviando pull requests.

## Licença

Este projeto está licenciado sob a ShareAlike 4.0 International License (CC BY-NC-SA 4.0) - veja o arquivo [LICENSE](LICENSE) para detalhes.

---

Desenvolvido por [ISMAEL PEDRO](https://www.linkedin.com/in/ismaelpedro/) como parte do processo seletivo da Mottu.
