import '../models/app_project_model.dart';
import '../providers/language_provider.dart';

/// Política de privacidade do app "Eleições e Políticos Brasil", publicada em
/// web/privacidade/eleicoes/. O app ainda não está na loja: quando estiver,
/// basta adicioná-lo às listas abaixo com `privacyPolicyUrl: eleicoesPrivacyPolicyUrl`.
const String eleicoesPrivacyPolicyUrl = 'https://adrianogba.is-a.dev/privacidade/eleicoes/';

/// Links fixos, iguais em todos os idiomas.
const String _selicStoreUrl = 'https://play.google.com/store/apps/details?id=adrianogba.selic';
const String _banricardStoreUrl = 'https://play.google.com/store/apps/details?id=br.com.sejavero.banricardmulti';
const String _selicAppStoreUrl = 'https://apps.apple.com/app/selic-agora-taxa-cdi-e-copom/id6835103999';
const String _banricardAppStoreUrl = 'https://apps.apple.com/br/app/banricard-multi/id6800410716';
const String _moaiArticleUrl = 'https://dock.tech/fluid/blog/cards-and-credit/autoatendimento-em-tempos-de-pandemia/?ac=1';
const String _selicShot = 'assets/screens/selic-agora.webp';
const String _banricardShot = 'assets/screens/banricard-multi.webp';

const String _voluntarioSiteUrl = 'https://sites.google.com/view/mpes-2024-2-g3/in%C3%ADcio';

class AppProjectService {
  /// Retorna os aplicativos do portfólio no idioma atual.
  Future<List<AppProjectModel>> getApps(AppLanguage currentLanguage) async {
    // Simulando uma chamada de API ou banco de dados
    await Future.delayed(const Duration(milliseconds: 300));

    if (currentLanguage == AppLanguage.german) {
      return _getGermanApps();
    } else if (currentLanguage == AppLanguage.english) {
      return _getEnglishApps();
    } else if (currentLanguage == AppLanguage.spanish) {
      return _getSpanishApps();
    } else {
      return _getPortugueseApps();
    }
  }

  /// Aplicativos em português
  List<AppProjectModel> _getPortugueseApps() {
    return [
      const AppProjectModel(
        name: 'Selic Agora',
        description: 'Aplicativo para acompanhar a taxa Selic, com gráfico do histórico, seleção de intervalo de datas e explicação sobre o indicador, com dados do Banco Central. Disponível em português e inglês.',
        storeUrl: _selicStoreUrl,
        appStoreUrl: _selicAppStoreUrl,
        screenshot: _selicShot,
      ),
      const AppProjectModel(
        name: 'Banricard Multi',
        description: 'Aplicativo do cartão Banricard Multibenefícios: consulta dos saldos das carteiras de benefícios, extrato e compras realizadas, desbloqueio do cartão, consulta e alteração de senha, bloqueio em caso de perda ou roubo e aprovação do cartão virtual.',
        storeUrl: _banricardStoreUrl,
        appStoreUrl: _banricardAppStoreUrl,
        screenshot: _banricardShot,
      ),
      const AppProjectModel(
        name: 'CheckGo: Autoatendimento para cartões private label',
        description: 'Aplicativo de totem de autoatendimento com pagamento de faturas via PIX e cartão de débito, consulta de saldo e limite de crédito, gestão do cartão e de parcelamentos, contratação de seguros, onboarding digital, troca de senha e quitação de dívidas.',
      ),
      const AppProjectModel(
        name: 'MOAI: Autoatendimento para cartões private label',
        description: 'Aplicativo de totem de autoatendimento com pagamento de faturas por cartão de débito, quitação e renegociação de dívidas, onboarding de clientes, reconhecimento facial e carrossel de imagens promocionais para publicidade na loja. Ampliou a autonomia do cliente, agilizou os serviços financeiros e criou mais um canal para campanhas de marketing.',
        websiteUrl: _moaiArticleUrl,
        websiteLabel: 'Artigo',
      ),
      const AppProjectModel(
        name: 'MOAI: Autoatendimento para pedidos de lanches',
        description: 'Aplicativo de totem de autoatendimento para o varejo, em que o próprio cliente navega pelos produtos, monta o pedido e conclui a compra por uma interface sensível ao toque.',
        websiteUrl: _moaiArticleUrl,
        websiteLabel: 'Artigo',
      ),
      const AppProjectModel(
        name: 'Voluntário Conectado',
        description: 'Plataforma de tecnologia social que conecta voluntários a organizações sem fins lucrativos, com backend em Spring Boot e aplicativo multiplataforma em Flutter. Desenvolvido na disciplina de Aprendizagem Baseada em Problemas (PBL) do Mestrado em Engenharia de Software da CESAR School e registrado no INPI, que garante a autoria por meio de um hash criptográfico do código-fonte.',
        websiteUrl: _voluntarioSiteUrl,
        websiteLabel: 'Site do projeto',
      ),
    ];
  }

  /// Aplicativos em inglês
  List<AppProjectModel> _getEnglishApps() {
    return [
      const AppProjectModel(
        name: 'Selic Agora',
        description: 'App for following the Brazilian Selic interest rate, with a chart of its history, date range selection and an explanation of the indicator, using Central Bank data. Available in Portuguese and English.',
        storeUrl: _selicStoreUrl,
        appStoreUrl: _selicAppStoreUrl,
        screenshot: _selicShot,
      ),
      const AppProjectModel(
        name: 'Banricard Multi',
        description: 'App for the Banricard multi-benefit card: benefit wallet balances, statement and card purchases, card activation, password lookup and change, blocking in case of loss or theft, and virtual card approval.',
        storeUrl: _banricardStoreUrl,
        appStoreUrl: _banricardAppStoreUrl,
        screenshot: _banricardShot,
      ),
      const AppProjectModel(
        name: 'CheckGo: Self-checkout app for private label credit cards',
        description: 'Self-service kiosk application featuring bill payments via PIX and debit card, balance and credit limit inquiries, card and installment plan management, insurance enrollment, digital onboarding, password changes and debt settlement.',
      ),
      const AppProjectModel(
        name: 'MOAI: Self-checkout app for private label credit cards',
        description: 'Self-service kiosk application featuring debit card bill payments, debt settlement and renegotiation, customer onboarding, facial recognition and promotional image carousels for in-store advertising. Enhanced customer autonomy while streamlining financial services and providing an additional channel for marketing campaigns.',
        websiteUrl: _moaiArticleUrl,
        websiteLabel: 'Article',
      ),
      const AppProjectModel(
        name: 'MOAI: Self-checkout app for food ordering',
        description: 'Self-checkout kiosk application for retail environments, enabling customers to independently place orders, browse products and complete purchases through an interactive touchscreen interface.',
        websiteUrl: _moaiArticleUrl,
        websiteLabel: 'Article',
      ),
      const AppProjectModel(
        name: 'Voluntário Conectado',
        description: 'A social technology platform designed to connect volunteers with non-profit organizations, built with a Spring Boot backend and a Flutter multiplatform application. Developed as part of a Problem-Based Learning (PBL) course in the Master\'s Degree in Software Engineering at CESAR School and officially registered with the INPI, ensuring authorship through a cryptographic hash of the source code.',
        websiteUrl: _voluntarioSiteUrl,
        websiteLabel: 'Project website',
      ),
    ];
  }

  /// Aplicativos em espanhol
  List<AppProjectModel> _getSpanishApps() {
    return [
      const AppProjectModel(
        name: 'Selic Agora',
        description: 'Aplicación para seguir la tasa Selic, con gráfico del histórico, selección de intervalo de fechas y explicación del indicador, con datos del Banco Central de Brasil. Disponible en portugués e inglés.',
        storeUrl: _selicStoreUrl,
        appStoreUrl: _selicAppStoreUrl,
        screenshot: _selicShot,
      ),
      const AppProjectModel(
        name: 'Banricard Multi',
        description: 'Aplicación de la tarjeta Banricard Multibeneficios: consulta de los saldos de las carteras de beneficios, extracto y compras realizadas, desbloqueo de la tarjeta, consulta y cambio de contraseña, bloqueo en caso de pérdida o robo y aprobación de la tarjeta virtual.',
        storeUrl: _banricardStoreUrl,
        appStoreUrl: _banricardAppStoreUrl,
        screenshot: _banricardShot,
      ),
      const AppProjectModel(
        name: 'CheckGo: Autoservicio para tarjetas private label',
        description: 'Aplicación de quiosco de autoservicio con pago de facturas por PIX y tarjeta de débito, consulta de saldo y límite de crédito, gestión de la tarjeta y de las cuotas, contratación de seguros, onboarding digital, cambio de contraseña y liquidación de deudas.',
      ),
      const AppProjectModel(
        name: 'MOAI: Autoservicio para tarjetas private label',
        description: 'Aplicación de quiosco de autoservicio con pago de facturas con tarjeta de débito, liquidación y renegociación de deudas, onboarding de clientes, reconocimiento facial y carrusel de imágenes promocionales para publicidad en la tienda. Amplió la autonomía del cliente, agilizó los servicios financieros y creó un canal adicional para campañas de marketing.',
        websiteUrl: _moaiArticleUrl,
        websiteLabel: 'Artículo',
      ),
      const AppProjectModel(
        name: 'MOAI: Autoservicio para pedidos de comida',
        description: 'Aplicación de quiosco de autoservicio para el comercio minorista, en la que el propio cliente navega por los productos, arma el pedido y concluye la compra mediante una interfaz táctil.',
        websiteUrl: _moaiArticleUrl,
        websiteLabel: 'Artículo',
      ),
      const AppProjectModel(
        name: 'Voluntário Conectado',
        description: 'Plataforma de tecnología social que conecta voluntarios con organizaciones sin fines de lucro, con backend en Spring Boot y aplicación multiplataforma en Flutter. Desarrollada en la asignatura de Aprendizaje Basado en Problemas (PBL) del Máster en Ingeniería de Software de CESAR School y registrada en el INPI, que garantiza la autoría mediante un hash criptográfico del código fuente.',
        websiteUrl: _voluntarioSiteUrl,
        websiteLabel: 'Sitio del proyecto',
      ),
    ];
  }

  /// Aplicativos em alemão
  List<AppProjectModel> _getGermanApps() {
    return [
      const AppProjectModel(
        name: 'Selic Agora',
        description: 'App zur Verfolgung des brasilianischen Leitzinses Selic, mit Verlaufsdiagramm, Auswahl des Zeitraums und einer Erklärung des Indikators, auf Basis von Daten der Zentralbank. Verfügbar auf Portugiesisch und Englisch.',
        storeUrl: _selicStoreUrl,
        appStoreUrl: _selicAppStoreUrl,
        screenshot: _selicShot,
      ),
      const AppProjectModel(
        name: 'Banricard Multi',
        description: 'App für die Banricard-Multi-Benefit-Karte: Guthaben der Benefit-Wallets, Kontoauszug und getätigte Einkäufe, Freischaltung der Karte, Abfrage und Änderung des Passworts, Sperrung bei Verlust oder Diebstahl sowie Freigabe der virtuellen Karte.',
        storeUrl: _banricardStoreUrl,
        appStoreUrl: _banricardAppStoreUrl,
        screenshot: _banricardShot,
      ),
      const AppProjectModel(
        name: 'CheckGo: Selbstbedienung für Private-Label-Kreditkarten',
        description: 'Selbstbedienungs-Kioskanwendung mit Rechnungszahlung per PIX und Debitkarte, Abfrage von Guthaben und Kreditlimit, Karten- und Ratenverwaltung, Versicherungsabschluss, digitalem Onboarding, Passwortänderung und Schuldentilgung.',
      ),
      const AppProjectModel(
        name: 'MOAI: Selbstbedienung für Private-Label-Kreditkarten',
        description: 'Selbstbedienungs-Kioskanwendung mit Rechnungszahlung per Debitkarte, Schuldentilgung und -umschuldung, Kunden-Onboarding, Gesichtserkennung und Karussell mit Werbebildern für die Filiale. Erhöhte die Eigenständigkeit der Kunden, beschleunigte die Finanzdienstleistungen und schuf einen weiteren Kanal für Marketingkampagnen.',
        websiteUrl: _moaiArticleUrl,
        websiteLabel: 'Artikel',
      ),
      const AppProjectModel(
        name: 'MOAI: Selbstbedienung für Essensbestellungen',
        description: 'Selbstbedienungs-Kioskanwendung für den Einzelhandel, bei der Kunden selbst durch die Produkte navigieren, ihre Bestellung zusammenstellen und den Kauf über eine Touchscreen-Oberfläche abschließen.',
        websiteUrl: _moaiArticleUrl,
        websiteLabel: 'Artikel',
      ),
      const AppProjectModel(
        name: 'Voluntário Conectado',
        description: 'Plattform für Sozialtechnologie, die Freiwillige mit gemeinnützigen Organisationen verbindet, mit einem Spring-Boot-Backend und einer plattformübergreifenden Flutter-Anwendung. Entwickelt im Rahmen des problembasierten Lernens (PBL) im Masterstudiengang Software Engineering der CESAR School und beim INPI registriert, das die Urheberschaft über einen kryptografischen Hash des Quellcodes sichert.',
        websiteUrl: _voluntarioSiteUrl,
        websiteLabel: 'Projektseite',
      ),
    ];
  }
}
