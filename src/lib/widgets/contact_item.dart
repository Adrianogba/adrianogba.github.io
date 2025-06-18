import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/analytics_service.dart';

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? url;
  final VoidCallback? onTap;
  
  const ContactItem({
    super.key, 
    required this.icon, 
    required this.text,
    this.url,
    this.onTap,
  }) : assert(url != null || onTap != null, 'Either url or onTap must be provided');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () async {
        if (url != null) {
          final Uri uri = Uri.parse(url!);
          if (await canLaunchUrl(uri)) {
            // Registrar evento de clique em contato
            final analyticsService = AnalyticsService();
            analyticsService.logContactClick(text);
            
            await launchUrl(uri);
          }
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              spreadRadius: 0.5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}