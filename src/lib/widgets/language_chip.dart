import 'package:flutter/material.dart';

class LanguageChip extends StatelessWidget {
  final String language;
  final String level;
  
  const LanguageChip({super.key, required this.language, required this.level});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(
            language,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            level,
            style: TextStyle(
              fontSize: 12,
              color: primaryColor.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}