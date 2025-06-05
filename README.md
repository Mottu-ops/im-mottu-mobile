# 🧪 I'm Mottu Mobile — Teste prático Flutter com PokeAPI

Este teste está dividido em três níveis de dificuldade. Você pode desenvolver seu App atendendo apenas a um nível ou a todos, conforme desejar demonstrar suas habilidades.

---

## ✅ Etapas Iniciais (obrigatórias para qualquer nível)

1. Faça um **fork deste repositório** para o seu GitHub como privado.
2. Adicione os usuários abaixo como colaboradores:
   - `@brunosmm`
   - `@BetoMottu`
3. Crie um novo projeto Flutter com o package:
4. Utilize a [PokeAPI](https://pokeapi.co/) como fonte de dados.
5. Crie um arquivo `README.md` com:
- Quais funcionalidades foram implementadas
- Como rodar o projeto
- Arquitetura utilizada (se houver)
6. O app deve buildar também para a plataforma **iOS**.

---

## 📚 Referência da API

A API utilizada neste teste é a [PokeAPI](https://pokeapi.co/). Abaixo, alguns endpoints úteis:

| Recurso              | Endpoint base                                 | Exemplo                                      |
|----------------------|-----------------------------------------------|----------------------------------------------|
| Lista de pokémons    | `/api/v2/pokemon`                             | https://pokeapi.co/api/v2/pokemon            |
| Detalhes do pokémon  | `/api/v2/pokemon/{name}`                      | https://pokeapi.co/api/v2/pokemon/pikachu    |
| Tipos                | `/api/v2/type`                                | https://pokeapi.co/api/v2/type/electric      |
| Habilidades          | `/api/v2/ability`                             | https://pokeapi.co/api/v2/ability/1          |

> A documentação completa está disponível em:  
> 🔗 https://pokeapi.co/docs/v2

---

## 🔸 Nível 1 — `level_1`

- Realizar todas as **etapas iniciais**
- Mostrar uma **listagem de Pokémons** com:
- Imagem
- Nome
- Ao clicar em um card da listagem, exibir a tela de **detalhes** com:
- Imagem
- Nome
- Altura
- Peso

---

## 🔸 Nível 2 — `level_2`

- Tudo do **Nível 1**
- Armazenar localmente em **cache** as consultas feitas à API
- Criar um **filtro por nome** para a listagem
- Na tela de detalhes, exibir também:
- **Tipos**
- **Habilidades**

---

## 🔸 Nível 3 — `level_3`

- Tudo do **Nível 2**
- Criar uma **Splash screen customizada**
- Limpar o **cache** ao fechar o app
- Implementar **paginação** na listagem
- Ao clicar em um tipo ou habilidade, exibir a lista de pokémons relacionados
- Permitir navegação para os detalhes de pokémons relacionados
- Criar **testes de unidade** para as regras de negócio

---

## 💎 Pontos Extras (opcional)

- Utilizar **GetX**
- Configurar **Firebase Crashlytics**
- Criar **channel nativo (Kotlin)** para detectar mudanças de conexão e exibir mensagem de status offline no app
- Utilizar uma arquitetura (MVC, MVVM, MVP, MVU)

---

## 💡 Boas práticas

- Faça commits frequentes e descritivos
- Trabalhe com **branches separadas por nível** (ex: `level_1`, `level_2`, etc)
- Use Pull Requests (PRs) ao evoluir entre níveis
- Seja criativo(a), mas evite cópias ou uso de IA — nós vamos perceber 😎

---

Boa sorte e divirta-se!  
🚀 Equipe Mottu
