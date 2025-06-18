import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tech_chip.dart';

class PublicationCard extends StatelessWidget {
  final String title;
  final String description;
  final String? journal;
  final String? year;
  final List<String> keywords;
  final String? url;
  
  const PublicationCard({
    super.key, 
    required this.title, 
    required this.description,
    this.journal,
    this.year,
    required this.keywords,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: url != null ? () async {
          final Uri uri = Uri.parse(url!);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        } : null,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: url != null ? () async {
                  final Uri uri = Uri.parse(url!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                } : null,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    decoration: url != null ? TextDecoration.underline : null,
                    decorationColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              if (journal != null || year != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: SelectableText(
                    [if (journal != null) journal, if (year != null) year]
                        .where((element) => element != null)
                        .join(' - '),
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              SelectableText(
                description,
                style: const TextStyle(height: 1.4),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: keywords.map((keyword) => TechChip(label: keyword)).toList(),
              ),
              // Removido o link explícito abaixo, agora o título é clicável
            ],
          ),
        ),
      ),
    );
  }
}