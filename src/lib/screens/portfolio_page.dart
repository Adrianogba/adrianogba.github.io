import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../localization/localization.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;
  bool _isLoading = true;

  // Serviços
  final PublicationService _publicationService = PublicationService();
  final ExperienceService _experienceService = ExperienceService();
  final EducationService _educationService = EducationService();
  final SkillService _skillService = SkillService();
  final ContactService _contactService = ContactService();

  // Dados
  List<PublicationModel> _publications = [];
  List<ExperienceModel> _experiences = [];
  List<EducationModel> _educations = [];
  Map<String, List<SkillModel>> _skillsByCategory = {};
  List<ContactModel> _contacts = [];

  // Serviço de analytics
  final AnalyticsService _analyticsService = AnalyticsService();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showBackToTopButton = _scrollController.offset >= 300;
      });
    });

    // Registrar visualização da tela
    _analyticsService.logScreenView('portfolio_page');

    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    // Carregar dados dos serviços
    final publications = await _publicationService.getPublications();
    final experiences = await _experienceService.getExperiences();
    final educations = await _educationService.getEducations();
    final skillsByCategory = await _skillService.getSkillsByCategory();
    final contacts = await _contactService.getContacts();

    // Atualizar estado
    setState(() {
      _publications = publications;
      _experiences = experiences;
      _educations = educations;
      _skillsByCategory = skillsByCategory;
      _contacts = contacts;
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);

    // Registrar evento de voltar ao topo
    _analyticsService.logSectionView('scroll_to_top');
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final strings = AppLocalizations(languageProvider.currentLanguage);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      floatingActionButton: _showBackToTopButton
          ? Padding(
              // Ajustar posição do botão para não sobrepor a barra flutuante
              padding: const EdgeInsets.only(bottom: 80),
              child: FloatingActionButton(onPressed: _scrollToTop, mini: true, tooltip: AppLocalizations(Provider.of<LanguageProvider>(context).currentLanguage).get('backToTop'), child: const Icon(Icons.arrow_upward)),
            )
          : null,
      body: Stack(
        children: [
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Scrollbar(
                  controller: _scrollController,
                  thickness: 8.0,
                  radius: const Radius.circular(10),
                  thumbVisibility: true,
                  interactive: true,
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 200.0,
                        floating: false,
                        pinned: true,
                        actions: [
                          // Botão para alternar o tema
                          IconButton(
                            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode, color: isDarkMode ? Colors.lightBlue : Colors.blue),
                            onPressed: () => themeProvider.toggleTheme(),
                            tooltip: isDarkMode ? AppLocalizations(Provider.of<LanguageProvider>(context).currentLanguage).get('lightMode') : AppLocalizations(Provider.of<LanguageProvider>(context).currentLanguage).get('darkMode'),
                          ),
                          // Botão para abrir o diálogo de seleção de idioma
                          IconButton(
                            icon: Icon(Icons.language, color: isDarkMode ? Colors.lightBlue : Colors.blue),
                            onPressed: () => showDialog(context: context, builder: (context) => const LanguageDialog()),
                            tooltip: AppLocalizations(Provider.of<LanguageProvider>(context).currentLanguage).get('selectLanguage'),
                          ),
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: const Text('Adriano Pontes'),
                          background: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.primaryContainer],
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: const DecorationImage(
                                      image: AssetImage('web/icons/2891052.jpeg'),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 800),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: SelectableText(
                                      strings.get('jobTitle'),
                                      style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.secondary),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Center(
                                    child: SelectableText(
                                      strings.get('location'),
                                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  // Removida a seção de contato do corpo principal
                                  const SizedBox(height: 16),

                                  // Seção Sobre Mim
                                  SectionTitle(title: strings.get('aboutMe')),
                                  SelectableText(
                                    strings.get('aboutMeContent'),
                                    style: const TextStyle(fontSize: 16, height: 1.5),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 32),

                                  // Seção Habilidades
                                  SectionTitle(title: strings.get('skills')),
                                  ..._buildSkillsSection(),
                                  const SizedBox(height: 32),

                                  // Seção Experiência Profissional
                                  SectionTitle(title: strings.get('experience')),
                                  ..._buildExperienceSection(),
                                  const SizedBox(height: 16),

                                  // Seção Educação
                                  SectionTitle(title: strings.get('education')),
                                  ..._buildEducationSection(),
                                  const SizedBox(height: 16),

                                  // Seção Publicações
                                  SectionTitle(title: strings.get('publications')),
                                  ..._buildPublicationsSection(),
                                  const SizedBox(height: 16),

                                  // Seção Idiomas
                                  SectionTitle(title: strings.get('languages')),
                                  Center(
                                    child: Wrap(
                                      spacing: 8.0,
                                      runSpacing: 8.0,
                                      alignment: WrapAlignment.center,
                                      children: [
                                        LanguageChip(language: strings.get('portuguese'), level: strings.get('native')),
                                        LanguageChip(language: strings.get('english'), level: strings.get('advanced')),
                                        LanguageChip(language: strings.get('spanish'), level: strings.get('basic')),
                                        LanguageChip(language: strings.get('german'), level: strings.get('basic')),
                                        LanguageChip(language: 'LIBRAS', level: strings.get('basic')),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 32),

                                  // Espaço adicional no final da página para evitar que a barra flutuante sobreponha o conteúdo
                                  const SizedBox(height: 100),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          // Barra flutuante na parte inferior com estilo de vidro fosco
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 15, spreadRadius: 2)],
                  border: Border.all(color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2), width: 1),
                  // Efeito de vidro fosco
                  backgroundBlendMode: BlendMode.srcOver,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Título "Contato:"
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Contato:",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    // Botões de contato com scroll horizontal
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: _buildContactsSection().map((widget) {
                          // Adicionar margem aos botões de contato
                          return Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: widget);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSkillsSection() {
    final List<Widget> widgets = [];

    // Coletar todas as habilidades de todas as categorias
    final List<SkillModel> allSkills = [];
    for (final category in _skillsByCategory.keys) {
      allSkills.addAll(_skillsByCategory[category]!);
    }

    // Ordenar todas as habilidades por proficiência (decrescente)
    allSkills.sort((a, b) => b.proficiency.compareTo(a.proficiency));

    // Adicionar todas as habilidades em um único Wrap
    widgets.add(Wrap(spacing: 8.0, runSpacing: 8.0, children: allSkills.map((skill) => SkillChip(label: skill.name)).toList()));

    return widgets;
  }

  List<Widget> _buildExperienceSection() {
    final List<Widget> widgets = [];

    for (final experience in _experiences) {
      widgets.add(
        PortfolioItemCard(
          title: experience.position,
          subtitle: experience.company,
          subtitleUrl: experience.companyUrl,
          period: experience.period,
          description: experience.description,
        ),
      );
      widgets.add(const SizedBox(height: 16));
    }

    return widgets;
  }

  List<Widget> _buildEducationSection() {
    final List<Widget> widgets = [];

    for (final education in _educations) {
      widgets.add(
        PortfolioItemCard(
          title: education.degree,
          subtitle: education.institution,
          subtitleUrl: education.institutionUrl,
          period: education.period,
          description: education.description ?? '',
        ),
      );
      widgets.add(const SizedBox(height: 16));
    }

    return widgets;
  }

  List<Widget> _buildPublicationsSection() {
    final List<Widget> widgets = [];

    // Exibir publicações em uma única coluna
    for (final publication in _publications) {
      widgets.add(
        PortfolioItemCard(
          title: publication.title,
          subtitle: publication.journal,
          period: publication.year,
          description: publication.description,
          url: publication.url,
          isPublication: true,
        ),
      );
      widgets.add(const SizedBox(height: 16));
    }

    return widgets;
  }

  List<Widget> _buildContactsSection() {
    return _contacts.map((contact) => ContactItem(icon: contact.icon, text: contact.label, url: contact.url)).toList();
  }
}
