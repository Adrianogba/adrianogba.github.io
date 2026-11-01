import '../models/lib_project_model.dart';
import '../providers/language_provider.dart';

/// Links fixos, iguais em todos os idiomas.
const String _glimmerRepo = 'https://github.com/Adrianogba/material_glimmer_ui';
const String _glimmerPackage = 'https://pub.dev/packages/material_glimmer_ui';
const String _sunMoonRepo = 'https://github.com/Adrianogba/sun_moon_switch';
const String _sunMoonPackage = 'https://pub.dev/packages/sun_moon_switch';
const String _flagsFlutterRepo = 'https://github.com/Adrianogba/brazil_state_flags_flutter';
const String _flagsFlutterPackage = 'https://pub.dev/packages/brazil_state_flags';
const String _flagsComposeRepo = 'https://github.com/Adrianogba/brazil-state-flags-compose';
const String _flagsComposePackage = 'https://central.sonatype.com/artifact/io.github.adrianogba/brazil-state-flags-compose';
const String _flagsSwiftRepo = 'https://github.com/Adrianogba/brazil-state-flags-swift';
const String _flagsSwiftPackage = 'https://swiftpackageindex.com/Adrianogba/brazil-state-flags-swift';
const String _flagsJsRepo = 'https://github.com/Adrianogba/brazil-state-flags-js';

const String _glimmerShot = 'assets/screens/material-glimmer-ui.webp';
const String _sunMoonShot = 'assets/screens/sun-moon-switch.webp';
const String _flagsShot = 'assets/screens/brazil-state-flags.webp';

const String _pubDev = 'pub.dev';
const String _mavenCentral = 'Maven Central';
const String _swiftPackageIndex = 'Swift Package Index';

const List<String> _flutterTech = ['Flutter', 'Dart'];
const List<String> _composeTech = ['Kotlin', 'Compose Multiplatform'];
const List<String> _swiftTech = ['Swift', 'SwiftUI'];
const List<String> _jsTech = ['TypeScript', 'React', 'Vue', 'React Native'];

class LibProjectService {
  /// Retorna as bibliotecas publicadas no idioma atual.
  Future<List<LibProjectModel>> getLibs() async {
    // Simulando uma chamada de API ou banco de dados
    await Future.delayed(const Duration(milliseconds: 300));

    final languageProvider = LanguageProvider();
    final currentLanguage = languageProvider.currentLanguage;

    if (currentLanguage == AppLanguage.german) {
      return _getGermanLibs();
    } else if (currentLanguage == AppLanguage.english) {
      return _getEnglishLibs();
    } else if (currentLanguage == AppLanguage.spanish) {
      return _getSpanishLibs();
    } else {
      return _getPortugueseLibs();
    }
  }

  /// Bibliotecas em português
  List<LibProjectModel> _getPortugueseLibs() {
    return [
      const LibProjectModel(
        name: 'material_glimmer_ui',
        description:
            'Kit de interface para Flutter com superfícies de vidro e bordas iluminadas, inspirado no Glimmer do Jetpack Compose e no Material Design.',
        technologies: _flutterTech,
        packageUrl: _glimmerPackage,
        packageLabel: _pubDev,
        repositoryUrl: _glimmerRepo,
        screenshot: _glimmerShot,
      ),
      const LibProjectModel(
        name: 'sun_moon_switch',
        description: 'Interruptor animado de dia e noite para Flutter: um sol com nuvens passando que vira uma lua com crateras sob estrelas cintilantes.',
        technologies: _flutterTech,
        packageUrl: _sunMoonPackage,
        packageLabel: _pubDev,
        repositoryUrl: _sunMoonRepo,
        screenshot: _sunMoonShot,
      ),
      const LibProjectModel(
        name: 'brazil_state_flags',
        description: 'Bandeiras dos 26 estados brasileiros, do Distrito Federal e do Brasil para Flutter, desenhadas como vetores em Dart puro. Sem imagens, sem dependências e nítidas em qualquer tamanho.',
        technologies: _flutterTech,
        packageUrl: _flagsFlutterPackage,
        packageLabel: _pubDev,
        repositoryUrl: _flagsFlutterRepo,
        screenshot: _flagsShot,
      ),
      const LibProjectModel(
        name: 'brazil-state-flags-compose',
        description: 'As mesmas bandeiras como ImageVectors para Compose Multiplatform, em Android, iOS e desktop. Sem recursos de imagem, sem dependências e nítidas em qualquer tamanho.',
        technologies: _composeTech,
        packageUrl: _flagsComposePackage,
        packageLabel: _mavenCentral,
        repositoryUrl: _flagsComposeRepo,
      ),
      const LibProjectModel(
        name: 'brazil-state-flags-swift',
        description:
            'As mesmas bandeiras como vetores SwiftUI para iOS, macOS, tvOS, watchOS e visionOS. Sem assets, sem dependências e nítidas em qualquer tamanho.',
        technologies: _swiftTech,
        packageUrl: _flagsSwiftPackage,
        packageLabel: _swiftPackageIndex,
        repositoryUrl: _flagsSwiftRepo,
      ),
      const LibProjectModel(
        name: 'brazil-state-flags-js',
        description: 'As mesmas bandeiras como dados vetoriais para React, Vue e React Native. Sem arquivos de imagem, sem dependências, nítidas em qualquer tamanho e só as bandeiras que você importar.',
        technologies: _jsTech,
        repositoryUrl: _flagsJsRepo,
      ),
    ];
  }

  /// Bibliotecas em inglês
  List<LibProjectModel> _getEnglishLibs() {
    return [
      const LibProjectModel(
        name: 'material_glimmer_ui',
        description: 'A Flutter UI kit of glass surfaces and lit edges, inspired by Jetpack Compose Glimmer and Material Design.',
        technologies: _flutterTech,
        packageUrl: _glimmerPackage,
        packageLabel: _pubDev,
        repositoryUrl: _glimmerRepo,
        screenshot: _glimmerShot,
      ),
      const LibProjectModel(
        name: 'sun_moon_switch',
        description: 'An animated day/night toggle switch for Flutter: a sun with drifting clouds becomes a cratered moon under twinkling stars.',
        technologies: _flutterTech,
        packageUrl: _sunMoonPackage,
        packageLabel: _pubDev,
        repositoryUrl: _sunMoonRepo,
        screenshot: _sunMoonShot,
      ),
      const LibProjectModel(
        name: 'brazil_state_flags',
        description: 'Flags of all 26 Brazilian states, the Federal District and Brazil for Flutter, drawn as vectors in pure Dart. No assets, no dependencies and sharp at any size.',
        technologies: _flutterTech,
        packageUrl: _flagsFlutterPackage,
        packageLabel: _pubDev,
        repositoryUrl: _flagsFlutterRepo,
        screenshot: _flagsShot,
      ),
      const LibProjectModel(
        name: 'brazil-state-flags-compose',
        description:
            'The same flags as ImageVectors for Compose Multiplatform, on Android, iOS and desktop. No resources, no dependencies and sharp at any size.',
        technologies: _composeTech,
        packageUrl: _flagsComposePackage,
        packageLabel: _mavenCentral,
        repositoryUrl: _flagsComposeRepo,
      ),
      const LibProjectModel(
        name: 'brazil-state-flags-swift',
        description: 'The same flags as SwiftUI vectors for iOS, macOS, tvOS, watchOS and visionOS. No assets, no dependencies and sharp at any size.',
        technologies: _swiftTech,
        packageUrl: _flagsSwiftPackage,
        packageLabel: _swiftPackageIndex,
        repositoryUrl: _flagsSwiftRepo,
      ),
      const LibProjectModel(
        name: 'brazil-state-flags-js',
        description: 'The same flags as vector data for React, Vue and React Native. No image assets, no dependencies, sharp at any size, and only the flags you import.',
        technologies: _jsTech,
        repositoryUrl: _flagsJsRepo,
      ),
    ];
  }

  /// Bibliotecas em espanhol
  List<LibProjectModel> _getSpanishLibs() {
    return [
      const LibProjectModel(
        name: 'material_glimmer_ui',
        description:
            'Kit de interfaz para Flutter con superficies de vidrio y bordes iluminados, inspirado en Glimmer de Jetpack Compose y en Material Design.',
        technologies: _flutterTech,
        packageUrl: _glimmerPackage,
        packageLabel: _pubDev,
        repositoryUrl: _glimmerRepo,
        screenshot: _glimmerShot,
      ),
      const LibProjectModel(
        name: 'sun_moon_switch',
        description:
            'Interruptor animado de día y noche para Flutter: un sol con nubes que pasan se convierte en una luna con cráteres bajo estrellas titilantes.',
        technologies: _flutterTech,
        packageUrl: _sunMoonPackage,
        packageLabel: _pubDev,
        repositoryUrl: _sunMoonRepo,
        screenshot: _sunMoonShot,
      ),
      const LibProjectModel(
        name: 'brazil_state_flags',
        description: 'Banderas de los 26 estados brasileños, el Distrito Federal y Brasil para Flutter, dibujadas como vectores en Dart puro. Sin imágenes, sin dependencias y nítidas en cualquier tamaño.',
        technologies: _flutterTech,
        packageUrl: _flagsFlutterPackage,
        packageLabel: _pubDev,
        repositoryUrl: _flagsFlutterRepo,
        screenshot: _flagsShot,
      ),
      const LibProjectModel(
        name: 'brazil-state-flags-compose',
        description: 'Las mismas banderas como ImageVectors para Compose Multiplatform, en Android, iOS y escritorio. Sin recursos de imagen, sin dependencias y nítidas en cualquier tamaño.',
        technologies: _composeTech,
        packageUrl: _flagsComposePackage,
        packageLabel: _mavenCentral,
        repositoryUrl: _flagsComposeRepo,
      ),
      const LibProjectModel(
        name: 'brazil-state-flags-swift',
        description:
            'Las mismas banderas como vectores SwiftUI para iOS, macOS, tvOS, watchOS y visionOS. Sin assets, sin dependencias y nítidas en cualquier tamaño.',
        technologies: _swiftTech,
        packageUrl: _flagsSwiftPackage,
        packageLabel: _swiftPackageIndex,
        repositoryUrl: _flagsSwiftRepo,
      ),
      const LibProjectModel(
        name: 'brazil-state-flags-js',
        description: 'Las mismas banderas como datos vectoriales para React, Vue y React Native. Sin archivos de imagen, sin dependencias, nítidas en cualquier tamaño y solo las banderas que importes.',
        technologies: _jsTech,
        repositoryUrl: _flagsJsRepo,
      ),
    ];
  }

  /// Bibliotecas em alemão
  List<LibProjectModel> _getGermanLibs() {
    return [
      const LibProjectModel(
        name: 'material_glimmer_ui',
        description: 'Flutter-UI-Kit mit Glasoberflächen und beleuchteten Kanten, inspiriert von Jetpack Compose Glimmer und Material Design.',
        technologies: _flutterTech,
        packageUrl: _glimmerPackage,
        packageLabel: _pubDev,
        repositoryUrl: _glimmerRepo,
        screenshot: _glimmerShot,
      ),
      const LibProjectModel(
        name: 'sun_moon_switch',
        description: 'Animierter Tag-/Nacht-Schalter für Flutter: Eine Sonne mit ziehenden Wolken wird zu einem Mond mit Kratern unter funkelnden Sternen.',
        technologies: _flutterTech,
        packageUrl: _sunMoonPackage,
        packageLabel: _pubDev,
        repositoryUrl: _sunMoonRepo,
        screenshot: _sunMoonShot,
      ),
      const LibProjectModel(
        name: 'brazil_state_flags',
        description: 'Flaggen aller 26 brasilianischen Bundesstaaten, des Bundesdistrikts und Brasiliens für Flutter, als Vektoren in reinem Dart gezeichnet. Ohne Assets, ohne Abhängigkeiten und in jeder Größe scharf.',
        technologies: _flutterTech,
        packageUrl: _flagsFlutterPackage,
        packageLabel: _pubDev,
        repositoryUrl: _flagsFlutterRepo,
        screenshot: _flagsShot,
      ),
      const LibProjectModel(
        name: 'brazil-state-flags-compose',
        description: 'Dieselben Flaggen als ImageVectors für Compose Multiplatform, auf Android, iOS und Desktop. Ohne Ressourcen, ohne Abhängigkeiten und in jeder Größe scharf.',
        technologies: _composeTech,
        packageUrl: _flagsComposePackage,
        packageLabel: _mavenCentral,
        repositoryUrl: _flagsComposeRepo,
      ),
      const LibProjectModel(
        name: 'brazil-state-flags-swift',
        description:
            'Dieselben Flaggen als SwiftUI-Vektoren für iOS, macOS, tvOS, watchOS und visionOS. Ohne Assets, ohne Abhängigkeiten und in jeder Größe scharf.',
        technologies: _swiftTech,
        packageUrl: _flagsSwiftPackage,
        packageLabel: _swiftPackageIndex,
        repositoryUrl: _flagsSwiftRepo,
      ),
      const LibProjectModel(
        name: 'brazil-state-flags-js',
        description: 'Dieselben Flaggen als Vektordaten für React, Vue und React Native. Ohne Bilddateien, ohne Abhängigkeiten, in jeder Größe scharf und nur die Flaggen, die importiert werden.',
        technologies: _jsTech,
        repositoryUrl: _flagsJsRepo,
      ),
    ];
  }
}
