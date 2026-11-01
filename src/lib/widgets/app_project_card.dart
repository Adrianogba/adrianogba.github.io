import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../localization/app_localizations.dart';
import '../models/app_project_model.dart';
import 'project_link_button.dart';
import 'project_screenshot.dart';

/// Card de um aplicativo na aba de portfólio.
class AppProjectCard extends StatelessWidget {
  final AppProjectModel app;
  final AppLocalizations strings;

  const AppProjectCard({super.key, required this.app, required this.strings});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.phone_android, size: 20, color: theme.colorScheme.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: SelectableText(app.name, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, letterSpacing: -0.2)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SelectableText(app.description, style: TextStyle(height: 1.5, color: theme.colorScheme.onSurfaceVariant)),
            if (app.screenshot != null) ...[const SizedBox(height: 16), ProjectScreenshot(asset: app.screenshot!, label: app.name)],
            if (_links.isNotEmpty) ...[const SizedBox(height: 16), Wrap(spacing: 8, runSpacing: 8, children: _links)],
          ],
        ),
      ),
    );
  }

  List<Widget> get _links {
    return [
      if (app.storeUrl != null)
        ProjectLinkButton(label: strings.get('googlePlay'), url: app.storeUrl!, icon: FontAwesomeIcons.googlePlay.data, linkType: 'app_store', primary: true),
      if (app.appStoreUrl != null)
        ProjectLinkButton(
          label: strings.get('appStore'),
          url: app.appStoreUrl!,
          icon: FontAwesomeIcons.appStoreIos.data,
          linkType: 'app_store_ios',
          primary: true,
        ),
      if (app.websiteUrl != null)
        ProjectLinkButton(
          label: app.websiteLabel ?? strings.get('learnMore'),
          url: app.websiteUrl!,
          icon: Icons.open_in_new,
          linkType: 'app_website',
          primary: app.storeUrl == null,
        ),
      if (app.privacyPolicyUrl != null)
        ProjectLinkButton(label: strings.get('privacyPolicy'), url: app.privacyPolicyUrl!, icon: Icons.privacy_tip_outlined, linkType: 'app_privacy_policy'),
    ];
  }
}
