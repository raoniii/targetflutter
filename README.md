Target App 🚀

Bem-vindo ao desenvolvimento do Target App.

## Sobre o Projeto 📱

O projeto é desenvolvido em Flutter e as dependencias: cupertino_icons, url_launcher, shared_preferences, build_runner, mobx_codegen, mobx, sqflite,  

## Configuração do Ambiente 🛠️

Antes de começar, certifique-se de ter o ambiente de desenvolvimento Flutter configurado. Se não tiver, siga as instruções na [documentação oficial do Flutter](https://flutter.dev/docs/get-started/install).

## Estrutura do Projeto 🏗️

A estrutura do projeto segue as melhores práticas do Flutter:

lib/
|- core/
| |- ui/
| | |- theme/
| | | | themeconfig.dart
| | |- widget/
| | | | button.dart
| | | | information_builders.dart
| | | | policyprivacy.dart
| | | | text_field.dart
|- page/
| |- home_page.dart
| |- login_page.dart
|- models/
| |- information_model.dart
|- controller.page/
| |- information_store.dart
| |- information_store.g.dart
|- database/
| |- controller/
| | | information_controller.dart
| |- database_config.dart

- `core/`: configuração de tema e widgets padrão.
- `page/`: Contém as telas do aplicativo.
- `models/`: Armazena os modelos de dados do aplicativo.
- `controllers/`: Contém os controladores para manipular lógica de negócios.
- `database/`: Armazena configurações e classes relacionadas ao banco de dados.

## Funcionalidades do App 🚀

### Listagem de Informações 📋

A tela principal exibe uma lista de informações. As informações são carregadas do banco de dados SQLite usando o `InformationController`.

### Adição e Edição de Informações ✏️

É possível adicionar novas informações e editar as existentes. As operações são manipuladas pelo `InformationController`.

## Como Contribuir 🤝

1. Faça um fork do repositório.
2. Crie uma branch para a sua feature: `git checkout -b feature/nova-feature`.
3. Faça as alterações e faça commit: `git commit -m 'Adiciona nova feature'`.
4. Envie para o seu fork: `git push origin feature/nova-feature`.
5. Abra um pull request para revisão.

## Agradecimentos 🙌

Agradecemos por contribuir para o nosso app Flutter! Sua ajuda é fundamental para torná-lo ainda melhor.

## Contato 📬

Para qualquer dúvida ou sugestão, entre em contato conosco.

Divirta-se desenvolvendo! 🎉


