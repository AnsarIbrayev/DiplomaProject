// Language switch (FR-39), demo switch of the study arm (FR-30, FR-31),
// active hours (FR-26) and the list of prototype rules (FR-37).

import 'package:flutter/material.dart';

import '../models/models.dart';
import '../rules/rule_base.dart';
import '../widgets/common.dart';
import 'onboarding.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final app = context.app;
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(l.language, style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        SegmentedButton<String>(
          segments: [
            for (final (locale, name) in languages)
              ButtonSegment(value: locale.languageCode, label: Text(name)),
          ],
          selected: {app.lang},
          onSelectionChanged: (s) => app.setLocale(Locale(s.first)),
          showSelectedIcon: false,
        ),
        const SizedBox(height: 24),
        Text(l.studyArm, style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        SegmentedButton<StudyArm>(
          segments: [
            ButtonSegment(
                value: StudyArm.intervention, label: Text(l.armIntervention)),
            ButtonSegment(value: StudyArm.control, label: Text(l.armControl)),
          ],
          selected: {app.arm},
          onSelectionChanged: (s) => app.setArm(s.first),
          showSelectedIcon: false,
        ),
        const SizedBox(height: 4),
        Text(l.armDemoNote, style: theme.textTheme.bodySmall),
        const SizedBox(height: 16),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.schedule),
          title: Text(l.activeHours),
          trailing: Text(l.activeHoursValue),
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.zero,
          leading: const Icon(Icons.rule),
          title: Text(l.ruleBase),
          children: [
            for (final r in Rules.all)
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                title: Text('${r.id} v${r.version} · '
                    '${ruleStatus(context, r.status)}'),
                subtitle: Text(r.source),
              ),
          ],
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.info_outline),
          title: Text(l.aboutPrototype),
          subtitle: Text(l.aboutBody),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: app.restartDemo,
          icon: const Icon(Icons.restart_alt),
          label: Text(l.restartDemo),
        ),
      ],
    );
  }
}
