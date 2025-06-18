import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? subtitleUrl;
  final String? period;
  final String description;
  final String? url;
  final bool isPublication;
  
  const PortfolioItemCard({
    super.key, 
    required this.title, 
    required this.subtitle,
    this.subtitleUrl,
    required this.period,
    required this.description,
    this.url,
    this.isPublication = false,
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
                  child: InkWell(
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
                        color: url != null ? Theme.of(context).colorScheme.primary : null,
                        decoration: url != null ? TextDecoration.underline : null,
                      ),
                    ),
                  ),
                ),
                period != null ?
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    period!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ) : Center(),
              ],
            ),
            const SizedBox(height: 4),
            InkWell(
              onTap: subtitleUrl != null ? () async {
                final Uri uri = Uri.parse(subtitleUrl!);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              } : null,
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: isPublication ? FontStyle.italic : FontStyle.normal,
                  color: subtitleUrl != null ? Theme.of(context).colorScheme.primary : null,
                  decoration: subtitleUrl != null ? TextDecoration.underline : null,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SelectableText(
              description,
              style: const TextStyle(height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}