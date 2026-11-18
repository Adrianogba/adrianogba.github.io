import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/profile_link_model.dart';

/// Links exibidos no cabeçalho. São nomes próprios, iguais em todos os idiomas.
class ProfileLinkService {
  const ProfileLinkService();

  /// Redes e formas de contato.
  List<ProfileLinkModel> get contatos => [
    ProfileLinkModel(label: 'LinkedIn', url: 'https://www.linkedin.com/in/adrianogba/', icon: FontAwesomeIcons.linkedinIn.data, linkType: 'profile_contact'),
    ProfileLinkModel(label: 'GitHub', url: 'https://github.com/adrianogba', icon: FontAwesomeIcons.github.data, linkType: 'profile_contact'),
    ProfileLinkModel(label: 'E-mail', url: 'mailto:ampontes93@gmail.com', icon: Icons.mail_outline, linkType: 'profile_contact'),
    ProfileLinkModel(label: 'WhatsApp', url: 'https://wa.me/5583996124792', icon: FontAwesomeIcons.whatsapp.data, linkType: 'profile_contact'),
  ];

  /// Onde minhas bibliotecas são publicadas.
  List<ProfileLinkModel> get registros => [
    ProfileLinkModel(
      label: 'pub.dev',
      url: 'https://pub.dev/publishers/adrianogba.is-a.dev/packages',
      icon: FontAwesomeIcons.flutter.data,
      linkType: 'profile_registry',
    ),
    ProfileLinkModel(
      label: 'Maven Central',
      url: 'https://central.sonatype.com/namespace/io.github.adrianogba',
      icon: FontAwesomeIcons.android.data,
      linkType: 'profile_registry',
    ),
    ProfileLinkModel(
      label: 'Swift Package Index',
      url: 'https://swiftpackageindex.com/Adrianogba',
      icon: FontAwesomeIcons.swift.data,
      linkType: 'profile_registry',
    ),
  ];

  List<ProfileLinkModel> get todos => [...contatos, ...registros];
}
