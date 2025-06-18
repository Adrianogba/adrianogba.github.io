import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/analytics_service.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final String tooltip;
  final Color? color;
  
  const SocialButton({
    super.key, 
    required this.icon, 
    required this.url, 
    required this.tooltip,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? Theme.of(context).colorScheme.primary;
    
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: () async {
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            // Registrar evento de clique em link social
            final analyticsService = AnalyticsService();
            analyticsService.logLinkClick('social_media', url);
            
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        borderRadius: BorderRadius.circular(30),
        child: Ink(
          decoration: BoxDecoration(
            color: buttonColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FaIcon(icon, color: buttonColor, size: 20),
          ),
        ),
      ),
    );
  }
}