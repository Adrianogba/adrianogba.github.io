import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/contact_model.dart';

class ContactService {
  /// Retorna uma lista de contatos
  Future<List<ContactModel>> getContacts() async {
    // Simulando uma chamada de API ou banco de dados
    await Future.delayed(const Duration(milliseconds: 300));
    
    return [
      ContactModel(
        label: 'Email',
        value: 'ampontes93@gmail.com',
        url: 'mailto:ampontes93@gmail.com',
        icon: Icons.email,
        color: Colors.red,
      ),
      ContactModel(
        label: 'LinkedIn',
        value: 'linkedin.com/in/adrianogba/',
        url: 'https://linkedin.com/in/adrianogba/',
        icon: FontAwesomeIcons.linkedin,
        color: Colors.blue.shade800,
      ),
      ContactModel(
        label: 'GitHub',
        value: 'github.com/adrianogba',
        url: 'https://github.com/adrianogba',
        icon: FontAwesomeIcons.github,
        color: Colors.black,
      ),
      ContactModel(
        label: 'WhatsApp',
        value: '+55 83 99612 4792',
        url: 'https://wa.me/5583996124792',
        icon: FontAwesomeIcons.whatsapp,
        color: Colors.green,
      ),
    ];
  }
}