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

class _PortfolioPageState extends State<PortfolioPage> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final TabController _tabController;
  bool _showBackToTopButton = false;
  bool _cabecalhoRecolhido = false;
  bool _isLoading = true;

  /// Altura do cabeçalho expandido, guardada para o listener de rolagem saber
  /// quando o título do topo deve aparecer. Em telas estreitas o cabeçalho é
  /// empilhado e precisa de mais espaço.
  double _alturaCabecalho = 300.0;

  /// Altura da faixa com as abas, reservada dentro do cabeçalho.
  static const double _alturaFaixaAbas = 64.0;

  static double _alturaCabecalhoPara(BuildContext context) => MediaQuery.sizeOf(context).width < 600 ? 384.0 : 324.0;

  // Serviços
  final PublicationService _publicationService = PublicationService();
  final ExperienceService _experienceService = ExperienceService();
  final EducationService _educationService = EducationService();
  final SkillService _skillService = SkillService();
  final ContactService _contactService = ContactService();
  final AppProjectService _appProjectService = AppProjectService();
  final LibProjectService _libProjectService = LibProjectService();

  // Dados
  List<PublicationModel> _publications = [];
  List<ExperienceModel> _experiences = [];
  List<EducationModel> _educations = [];
  Map<String, List<SkillModel>> _skillsByCategory = {};
  List<ContactModel> _contacts = [];
  List<AppProjectModel> _apps = [];
  List<LibProjectModel> _libs = [];

  // Serviço de analytics
  final AnalyticsService _analyticsService = AnalyticsService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)..addListener(_onTabChanged);
    _scrollController.addListener(() {
      // Só reconstrói quando o botão realmente entra ou sai de cena: antes isso
      // rodava a cada pixel de rolagem e refazia a página (e as imagens) inteira.
      final mostrarBotao = _scrollController.offset >= 300;
      final recolhido = _scrollController.offset >= _alturaCabecalho - kToolbarHeight - 64;
      if (mostrarBotao != _showBackToTopButton || recolhido != _cabecalhoRecolhido) {
        setState(() {
          _showBackToTopButton = mostrarBotao;
          _cabecalhoRecolhido = recolhido;
        });
      }
    });

    // Registrar visualização da tela
    _analyticsService.logScreenView('portfolio_page');

    _loadData();
  }

  /// Cada aba tem seu próprio conteúdo na mesma rolagem, então ao trocar de aba
  /// a página volta ao topo.
  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    setState(() {});
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }
    _analyticsService.logSectionView(_tabController.index == 0 ? 'tab_portfolio' : 'tab_resume');
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    // Carregar tudo em paralelo: em série cada serviço espera o anterior e a
    // página demora vários segundos para aparecer.
    final results = await Future.wait([
      _publicationService.getPublications(),
      _experienceService.getExperiences(),
      _educationService.getEducations(),
      _skillService.getSkillsByCategory(),
      _contactService.getContacts(),
      _appProjectService.getApps(),
      _libProjectService.getLibs(),
    ]);

    if (!mounted) return;

    // Atualizar estado
    setState(() {
      _publications = results[0] as List<PublicationModel>;
      _experiences = results[1] as List<ExperienceModel>;
      _educations = results[2] as List<EducationModel>;
      _skillsByCategory = results[3] as Map<String, List<SkillModel>>;
      _contacts = results[4] as List<ContactModel>;
      _apps = results[5] as List<AppProjectModel>;
      _libs = results[6] as List<LibProjectModel>;
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
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
    // O tema padrão é ThemeMode.system, então themeProvider.isDarkMode só
    // responde ao modo escolhido à mão. Aqui vale o brilho que está valendo.
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    _alturaCabecalho = _alturaCabecalhoPara(context);

    return Scaffold(
      floatingActionButton: _showBackToTopButton
          ? Padding(
              // Ajustar posição do botão para não sobrepor a barra flutuante
              padding: const EdgeInsets.only(bottom: 80),
              child: FloatingActionButton(onPressed: _scrollToTop, mini: true, tooltip: strings.get('backToTop'), child: const Icon(Icons.arrow_upward)),
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
                        expandedHeight: _alturaCabecalho,
                        floating: false,
                        pinned: true,
                        backgroundColor: GridBannerColors.background(isDarkMode).last,
                        foregroundColor: GridBannerColors.foreground(isDarkMode),
                        surfaceTintColor: Colors.transparent,
                        actions: [
                          // Botão para alternar o tema
                          IconButton(
                            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode, color: GridBannerColors.foreground(isDarkMode)),
                            iconSize: 26,
                            padding: const EdgeInsets.all(12),
                            onPressed: () => themeProvider.toggleTheme(),
                            tooltip: isDarkMode
                                ? AppLocalizations(Provider.of<LanguageProvider>(context).currentLanguage).get('lightMode')
                                : AppLocalizations(Provider.of<LanguageProvider>(context).currentLanguage).get('darkMode'),
                          ),
                          // Botão para abrir o diálogo de seleção de idioma
                          IconButton(
                            icon: Icon(Icons.language, color: GridBannerColors.foreground(isDarkMode)),
                            iconSize: 26,
                            padding: const EdgeInsets.all(12),
                            onPressed: () => showDialog(context: context, builder: (context) => const LanguageDialog()),
                            tooltip: AppLocalizations(Provider.of<LanguageProvider>(context).currentLanguage).get('selectLanguage'),
                          ),
                        ],
                        // Título só aparece quando o cabeçalho encolhe.
                        title: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: _cabecalhoRecolhido ? 1 : 0,
                          child: _TituloRecolhido(jobTitle: strings.get('jobTitle'), cor: GridBannerColors.foreground(isDarkMode)),
                        ),
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(_alturaFaixaAbas),
                          // Fundo sólido: ao rolar, esta faixa passa por cima
                          // dos ícones do banner e não pode deixá-los aparecer.
                          child: Container(
                            color: GridBannerColors.background(isDarkMode).last,
                            padding: const EdgeInsets.only(top: 6, bottom: 10),
                            child: PillTabBar(controller: _tabController, isDark: isDarkMode, labels: [strings.get('tabPortfolio'), strings.get('tabResume')]),
                          ),
                        ),
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              GridBanner(isDark: isDarkMode),
                              SafeArea(
                                bottom: false,
                                child: Padding(
                                  // Reserva a faixa das abas: o background do
                                  // FlexibleSpaceBar ocupa a app bar inteira.
                                  padding: const EdgeInsets.only(top: kToolbarHeight - 12, bottom: _alturaFaixaAbas),
                                  child: BannerHeader(isDark: isDarkMode, jobTitle: strings.get('jobTitle')),
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
                            // A troca de aba entra deslizando e esmaecendo.
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 320),
                              switchInCurve: Curves.easeOutCubic,
                              switchOutCurve: Curves.easeInCubic,
                              layoutBuilder: (atual, anteriores) => Stack(alignment: Alignment.topCenter, children: [...anteriores, ?atual]),
                              transitionBuilder: (child, animation) => FadeTransition(
                                opacity: animation,
                                child: SlideTransition(
                                  position: Tween<Offset>(begin: const Offset(0, 0.04), end: Offset.zero).animate(animation),
                                  child: child,
                                ),
                              ),
                              child: ConstrainedBox(
                                // O portfólio é um mosaico e aproveita telas
                                // largas; o currículo é texto corrido e fica
                                // mais legível em coluna estreita.
                                key: ValueKey<int>(_tabController.index),
                                constraints: BoxConstraints(maxWidth: _tabController.index == 0 ? 1180 : 800),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...(_tabController.index == 0 ? _buildPortfolioTab(strings) : _buildResumeTab(strings)),

                                    // Espaço adicional no final da página para evitar que a barra flutuante sobreponha o conteúdo
                                    const SizedBox(height: 100),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          // Barra flutuante na parte inferior com fundo de vidro fosco. Só
          // aparece depois do carregamento, senão fica visível e vazia.
          if (!_isLoading)
            Positioned(
              left: 0,
              right: 0,
              bottom: 16,
              child: Center(
                child: FrostedGlassContainer(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Título "Contato:"
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          '${strings.get('contact')}:',
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

  /// Aba de portfólio: aplicativos e bibliotecas publicadas.
  List<Widget> _buildPortfolioTab(AppLocalizations strings) {
    return [
      SectionTitle(title: strings.get('apps')),
      SelectableText(strings.get('appsIntro'), style: const TextStyle(fontSize: 15, height: 1.5)),
      const SizedBox(height: 16),
      ProjectGrid(
        children: [for (final app in _apps) AppProjectCard(app: app, strings: strings)],
      ),
      const SizedBox(height: 32),

      SectionTitle(title: strings.get('libraries')),
      SelectableText(strings.get('librariesIntro'), style: const TextStyle(fontSize: 15, height: 1.5)),
      const SizedBox(height: 16),
      ProjectGrid(
        children: [for (final lib in _libs) LibProjectCard(lib: lib, strings: strings)],
      ),
    ];
  }

  /// Aba de currículo: sobre, habilidades, experiência, educação, publicações
  /// e idiomas.
  List<Widget> _buildResumeTab(AppLocalizations strings) {
    return [
      // Seção Sobre Mim
      SectionTitle(title: strings.get('aboutMe')),
      SelectableText(strings.get('aboutMeContent'), style: const TextStyle(fontSize: 16, height: 1.5), textAlign: TextAlign.justify),
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
    ];
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

/// Na barra recolhida mostra "Adriano Pontes - cargo" quando a largura
/// permite; se não couber, mostra só o nome.
class _TituloRecolhido extends StatelessWidget {
  final String jobTitle;
  final Color cor;

  const _TituloRecolhido({required this.jobTitle, required this.cor});

  @override
  Widget build(BuildContext context) {
    final estilo = TextStyle(fontWeight: FontWeight.w700, letterSpacing: -0.5, color: cor, fontSize: 18);

    return LayoutBuilder(
      builder: (context, constraints) {
        const nome = 'Adriano Pontes';
        final completo = '$nome - $jobTitle';
        final medida = TextPainter(
          text: TextSpan(text: completo, style: estilo),
          maxLines: 1,
          textDirection: TextDirection.ltr,
        )..layout();
        final cabe = medida.width <= constraints.maxWidth;
        return Text(cabe ? completo : nome, style: estilo, maxLines: 1, overflow: TextOverflow.ellipsis);
      },
    );
  }
}
