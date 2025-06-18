import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // We don't need the theme provider here as we're using Theme.of(context)

    return Scaffold(
      appBar: AppBar(
        title: const Text('Política de Privacidade'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Scrollbar(
        thickness: 8.0,
        radius: const Radius.circular(10),
        thumbVisibility: true,
        interactive: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Política de Privacidade',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Última atualização: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  
                  _buildSection(
                    'Introdução',
                    'Esta Política de Privacidade descreve como coletamos, usamos e compartilhamos informações quando você utiliza nossos aplicativos móveis ("Aplicativos"). Nossos Aplicativos são simples e não requerem cadastro de usuários, mas podem conter anúncios e coletar dados básicos para melhorar a experiência do usuário e para fins de publicidade.',
                  ),
                  
                  _buildSection(
                    'Informações que Coletamos',
                    'Nossos Aplicativos podem coletar os seguintes tipos de informações:\n\n'
                    '• Informações do dispositivo: Coletamos informações sobre o dispositivo que você usa para acessar nossos Aplicativos, incluindo modelo do dispositivo, sistema operacional, identificadores únicos de dispositivo e informações de rede móvel.\n\n'
                    '• Dados de uso: Registramos informações sobre como você usa nossos Aplicativos, como quais recursos você utiliza, quanto tempo passa no aplicativo e erros ou falhas que possam ocorrer.\n\n'
                    '• Dados de localização aproximada: Podemos coletar e processar informações sobre sua localização aproximada. Esta localização é derivada do seu endereço IP ou do código do país do seu dispositivo móvel e é usada apenas para fornecer anúncios relevantes.',
                  ),
                  
                  _buildSection(
                    'Como Usamos Suas Informações',
                    'Usamos as informações que coletamos para:\n\n'
                    '• Fornecer, manter e melhorar nossos Aplicativos;\n'
                    '• Desenvolver novos produtos e recursos;\n'
                    '• Personalizar sua experiência;\n'
                    '• Medir o desempenho dos Aplicativos;\n'
                    '• Comunicar-se com você, se necessário;\n'
                    '• Prevenir fraudes e abusos;\n'
                    '• Exibir anúncios relevantes através de redes de publicidade de terceiros.',
                  ),
                  
                  _buildSection(
                    'Publicidade',
                    'Nossos Aplicativos exibem anúncios fornecidos por redes de publicidade de terceiros. Estas redes podem coletar e usar informações sobre suas visitas a nossos Aplicativos e outros sites e aplicativos para fornecer anúncios sobre produtos e serviços que possam ser de seu interesse. As informações coletadas podem incluir o tipo de dispositivo, o endereço IP e o identificador de publicidade do dispositivo.\n\n'
                    'Utilizamos os seguintes serviços de publicidade:\n\n'
                    '• Google AdMob\n'
                    '• Google Analytics for Firebase\n\n'
                    'Você pode optar por desativar a publicidade personalizada nas configurações do seu dispositivo ou visitando www.aboutads.info/choices ou www.youronlinechoices.eu.',
                  ),
                  
                  _buildSection(
                    'Compartilhamento de Informações',
                    'Não vendemos informações pessoais a terceiros. Podemos compartilhar informações não pessoais, agregadas ou anônimas com parceiros, como:\n\n'
                    '• Provedores de serviços que nos ajudam a operar nossos Aplicativos;\n'
                    '• Parceiros de análise para entender como nossos Aplicativos são usados;\n'
                    '• Redes de publicidade para exibir anúncios;\n'
                    '• Quando exigido por lei ou para proteger direitos e segurança.',
                  ),
                  
                  _buildSection(
                    'Segurança',
                    'Tomamos medidas razoáveis para proteger as informações coletadas contra perda, roubo, uso indevido e acesso não autorizado. No entanto, nenhum sistema é completamente seguro, e não podemos garantir a segurança absoluta das suas informações.',
                  ),
                  
                  _buildSection(
                    'Seus Direitos',
                    'Dependendo da sua localização, você pode ter certos direitos relacionados às suas informações pessoais, como:\n\n'
                    '• Acessar as informações que temos sobre você;\n'
                    '• Corrigir informações imprecisas;\n'
                    '• Excluir suas informações;\n'
                    '• Restringir ou opor-se ao processamento de suas informações;\n'
                    '• Portabilidade de dados;\n'
                    '• Retirar consentimento.\n\n'
                    'Para exercer esses direitos, entre em contato conosco através das informações fornecidas abaixo.',
                  ),
                  
                  _buildSection(
                    'Crianças',
                    'Nossos Aplicativos não são direcionados a crianças menores de 13 anos, e não coletamos intencionalmente informações pessoais de crianças menores de 13 anos. Se descobrirmos que coletamos informações pessoais de uma criança menor de 13 anos, tomaremos medidas para excluir essas informações o mais rápido possível.',
                  ),
                  
                  _buildSection(
                    'Alterações nesta Política',
                    'Podemos atualizar esta Política de Privacidade periodicamente. A versão mais recente estará sempre disponível em nosso site e nos Aplicativos. Recomendamos que você revise esta política regularmente. O uso continuado de nossos Aplicativos após alterações constitui aceitação da política atualizada.',
                  ),
                  
                  _buildSection(
                    'Contato',
                    'Se você tiver dúvidas ou preocupações sobre esta Política de Privacidade ou nossas práticas de dados, entre em contato conosco em: [seu-email@exemplo.com]',
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Rodapé
                  const Center(
                    child: Text(
                      '© 2023 Adriano Pontes. Todos os direitos reservados.',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SelectableText(
            content,
            style: const TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}