# Portfólio Website

![Flutter](https://img.shields.io/badge/Flutter-3.8.1-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.8.1-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## 📱 Visão Geral

Este é um site de portfólio profissional desenvolvido com Flutter Web. O site apresenta um design moderno e responsivo, com tema claro/escuro, e exibe informações sobre habilidades, educação, projetos e contato.

## ✨ Funcionalidades

- **Design Responsivo**: Layout adaptável para diferentes tamanhos de tela
- **Tema Claro/Escuro**: Suporte a temas claro e escuro
- **Seções Organizadas**: Perfil, Sobre Mim, Habilidades, Educação, Projetos e Contato
- **Links Interativos**: Botões de redes sociais e contato funcionais
- **Componentes Reutilizáveis**: Arquitetura modular com widgets personalizados
- **Suporte a AdMob**: Inclui arquivo app-ads.txt para conformidade com AdMob

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework UI multiplataforma da Google
- **Dart**: Linguagem de programação otimizada para desenvolvimento de aplicativos
- **Material Design 3**: Sistema de design moderno com suporte a temas dinâmicos
- **url_launcher**: Plugin para abrir URLs em navegadores externos
- **font_awesome_flutter**: Biblioteca de ícones para redes sociais e outros elementos

## 📂 Estrutura do Projeto

```
portfolio_website/
├── lib/
│   └── main.dart         # Código principal da aplicação
├── web/                  # Arquivos específicos para web
│   ├── index.html        # Página HTML base
│   ├── manifest.json     # Configurações de PWA
│   ├── app-ads.txt       # Arquivo de conformidade com AdMob
│   └── icons/            # Ícones da aplicação
├── pubspec.yaml          # Dependências e configurações do projeto
└── README.md             # Documentação do projeto
```

## 🚀 Componentes Principais

- **PortfolioHomePage**: Página principal com layout responsivo
- **SocialButton**: Botões de redes sociais com efeitos visuais
- **SectionTitle**: Títulos de seção com estilo personalizado
- **SkillChip**: Chips para exibição de habilidades técnicas
- **ProjectCard**: Cards para exibição de projetos
- **EducationCard**: Cards para exibição de formação acadêmica
- **ContactItem**: Itens de contato interativos

## 🔧 Instalação e Execução

### Pré-requisitos

- Flutter SDK (versão 3.8.1 ou superior)
- Dart SDK (versão 3.8.1 ou superior)
- Git

### Passos para Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/portfolio_website.git
   cd portfolio_website
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

3. Execute o projeto em modo de desenvolvimento:
   ```bash
   flutter run -d chrome
   ```

4. Para construir a versão de produção:
   ```bash
   flutter build web
   ```
   Os arquivos gerados estarão na pasta `build/web`

## 📤 Implantação

### GitHub Pages

1. Construa o projeto:
   ```bash
   flutter build web --base-href /portfolio_website/
   ```

2. Publique a pasta `build/web` no GitHub Pages

### Firebase Hosting

1. Instale o Firebase CLI:
   ```bash
   npm install -g firebase-tools
   ```

2. Faça login no Firebase:
   ```bash
   firebase login
   ```

3. Inicialize o projeto Firebase:
   ```bash
   firebase init hosting
   ```

4. Implante o site:
   ```bash
   firebase deploy
   ```

## 📝 Personalização

Para personalizar o site para suas necessidades:

1. Atualize as informações pessoais em `main.dart`
2. Substitua os links de redes sociais
3. Atualize as seções de habilidades, educação e projetos
4. Personalize as cores e temas conforme necessário
5. Adicione sua própria foto de perfil

## 📱 Suporte a AdMob

O arquivo `app-ads.txt` na raiz do projeto é necessário para conformidade com o Google AdMob. Se você planeja monetizar aplicativos móveis relacionados, mantenha este arquivo atualizado com seu ID de editor.

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE para detalhes.

## 👨‍💻 Autor

Adriano Pontes - [LinkedIn](https://www.linkedin.com/in/adrianogba/) - [GitHub](https://github.com/adrianogba)

---

⭐️ Desenvolvido com Flutter Web ⭐️