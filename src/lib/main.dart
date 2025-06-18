import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfólio de Adriano',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0077B5), // Cor do LinkedIn
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0077B5),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      themeMode: ThemeMode.system,
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar com efeito de rolagem
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            backgroundColor: primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Adriano GBA',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      primaryColor,
                      primaryColor.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Color(0xFF0077B5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                onPressed: () {
                  // Aqui você implementaria a troca de tema
                },
                tooltip: 'Alternar tema',
              ),
            ],
          ),
          
          // Conteúdo principal
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título e subtítulo
                      const Center(
                        child: Text(
                          'Mobile Developer | MSc Software Engineering Student',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Seção de redes sociais
                      Center(
                        child: Wrap(
                          spacing: 16,
                          children: [
                            SocialButton(
                              icon: FontAwesomeIcons.linkedin,
                              url: 'https://www.linkedin.com/in/adrianogba/',
                              tooltip: 'LinkedIn',
                              color: const Color(0xFF0077B5),
                            ),
                            SocialButton(
                              icon: FontAwesomeIcons.github,
                              url: 'https://github.com/adrianogba',
                              tooltip: 'GitHub',
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Seção Sobre Mim
                      const SectionTitle(title: 'Sobre Mim'),
                      const Text(
                        'Software developer desde 2016, com formação em Sistemas de Informação e atualmente cursando Mestrado em Engenharia de Software. A maior parte da minha experiência profissional está no desenvolvimento mobile, mas também tenho experiência com várias tecnologias e estou aberto a desafios interessantes.',
                        style: TextStyle(fontSize: 16, height: 1.5),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 24),
                      
                      // Seção Habilidades
                      const SectionTitle(title: 'Habilidades'),
                      const Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          SkillChip(label: 'Flutter'),
                          SkillChip(label: 'Dart'),
                          SkillChip(label: 'Mobile Development'),
                          SkillChip(label: 'Android'),
                          SkillChip(label: 'iOS'),
                          SkillChip(label: 'Firebase'),
                          SkillChip(label: 'REST API'),
                          SkillChip(label: 'Git'),
                          SkillChip(label: 'Machine Learning'),
                          SkillChip(label: 'Software Engineering'),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // Seção Educação
                      const SectionTitle(title: 'Educação'),
                      EducationCard(
                        degree: 'Mestrado em Engenharia de Software',
                        institution: 'Universidade',
                        period: 'Em andamento',
                        description: 'Foco em desenvolvimento de software e metodologias ágeis.',
                      ),
                      const SizedBox(height: 16),
                      EducationCard(
                        degree: 'Bacharelado em Sistemas de Informação',
                        institution: 'Universidade',
                        period: 'Concluído',
                        description: 'Formação em desenvolvimento de sistemas e análise de dados.',
                      ),
                      const SizedBox(height: 24),
                      
                      // Seção Projetos
                      const SectionTitle(title: 'Projetos'),
                      ProjectCard(
                        title: 'Aplicativo Mobile',
                        description: 'Desenvolvimento de aplicativos móveis para Android e iOS utilizando Flutter.',
                        technologies: ['Flutter', 'Dart', 'Firebase'],
                        onTap: () {
                          // Ação ao clicar no projeto
                        },
                      ),
                      const SizedBox(height: 16),
                      ProjectCard(
                        title: 'Pesquisa em Machine Learning',
                        description: 'Estudo sobre aplicação de modelos de machine learning para processamento de dados.',
                        technologies: ['Python', 'TensorFlow', 'Data Analysis'],
                        onTap: () {
                          // Ação ao clicar no projeto
                        },
                      ),
                      const SizedBox(height: 24),
                      
                      // Seção Contato
                      const SectionTitle(title: 'Contato'),
                      ContactItem(
                        icon: Icons.email,
                        text: 'Entre em contato por e-mail',
                        onTap: () async {
                          final Uri emailUri = Uri(
                            scheme: 'mailto',
                            path: 'seu.email@exemplo.com',
                          );
                          if (await canLaunchUrl(emailUri)) {
                            await launchUrl(emailUri);
                          }
                        },
                      ),
                      ContactItem(
                        icon: FontAwesomeIcons.linkedin,
                        text: 'Conecte-se no LinkedIn',
                        onTap: () async {
                          final Uri url = Uri.parse('https://www.linkedin.com/in/adrianogba/');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url, mode: LaunchMode.externalApplication);
                          }
                        },
                      ),
                      const SizedBox(height: 40),
                      
                      // Rodapé
                      const Center(
                        child: Text(
                          '© 2024 - Desenvolvido com Flutter',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            // Link para o arquivo app-ads.txt
                          },
                          child: const Text('AdMob Compliance'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget para botões de redes sociais
class SocialButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final String tooltip;
  final Color color;
  
  const SocialButton({
    super.key, 
    required this.icon, 
    required this.url, 
    required this.tooltip,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: () async {
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        borderRadius: BorderRadius.circular(30),
        child: Ink(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FaIcon(icon, color: color, size: 24),
          ),
        ),
      ),
    );
  }
}

// Widgets auxiliares
class SectionTitle extends StatelessWidget {
  final String title;
  
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Divider(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;
  
  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Chip(
      backgroundColor: primaryColor.withOpacity(0.1),
      side: BorderSide(color: primaryColor.withOpacity(0.3)),
      avatar: Icon(
        Icons.check_circle_outline,
        color: primaryColor,
        size: 16,
      ),
      label: Text(
        label,
        style: TextStyle(color: primaryColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final VoidCallback onTap;
  
  const ProjectCard({
    super.key, 
    required this.title, 
    required this.description,
    required this.technologies,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(height: 1.4),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: technologies.map((tech) => TechChip(label: tech)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TechChip extends StatelessWidget {
  final String label;
  
  const TechChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}

class EducationCard extends StatelessWidget {
  final String degree;
  final String institution;
  final String period;
  final String description;
  
  const EducationCard({
    super.key, 
    required this.degree, 
    required this.institution, 
    required this.period,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    degree,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    period,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              institution,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  
  const ContactItem({
    super.key, 
    required this.icon, 
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
