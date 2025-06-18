import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationCard extends StatelessWidget {
  final String degree;
  final String institution;
  final String? institutionUrl;
  final String period;
  final String? description;
  
  const EducationCard({
    super.key, 
    required this.degree, 
    required this.institution, 
    this.institutionUrl,
    required this.period,
    this.description,
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
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
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
            InkWell(
              onTap: institutionUrl != null ? () async {
                final Uri uri = Uri.parse(institutionUrl!);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              } : null,
              child: Text(
                institution,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                  decoration: institutionUrl != null ? TextDecoration.underline : null,
                ),
              ),
            ),
            if (description != null) ...[  
              const SizedBox(height: 8),
              Text(description!),
            ],
          ],
        ),
      ),
    );
  }
}