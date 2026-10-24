// Recommendations ordered by factor ranking (FR-22) with a "Why?"
// explanation for each (FR-23) and the hard-constraint checks (FR-24).

import 'package:flutter/material.dart';

import '../rules/rule_base.dart';
import '../widgets/common.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final app = context.app;
    final theme = Theme.of(context);
    final checks = checkHardConstraints(app.targets);
    final recs = app.recommendations;

    String constraintName(Constraint c) => switch (c) {
          Constraint.energy => l.constraintEnergy,
          Constraint.macros => l.constraintMacros,
          Constraint.calcium => l.constraintCalcium,
          Constraint.intensity => l.constraintIntensity,
        };

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (app.activitySuspended)
          NoteBanner(text: l.suspendedBanner, warning: true),
        Text(l.planIntro),
        const SizedBox(height: 12),
        for (var i = 0; i < recs.length; i++)
          _RecommendationCard(index: i + 1, rec: recs[i]),
        const SizedBox(height: 4),
        SectionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(Icons.verified_user_outlined,
                    color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(l.constraintsTitle,
                      style: theme.textTheme.titleSmall),
                ),
                Text('${checks.where((c) => c.passed).length}/${checks.length}',
                    style: theme.textTheme.titleSmall),
              ]),
              const SizedBox(height: 8),
              for (final c in checks)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(c.passed ? Icons.check : Icons.close,
                          size: 18,
                          color: c.passed
                              ? theme.colorScheme.primary
                              : theme.colorScheme.error),
                      const SizedBox(width: 8),
                      Expanded(child: Text(constraintName(c.constraint))),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({required this.index, required this.rec});

  final int index;
  final Recommendation rec;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final factor = rec.factor;
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text('$index',
                style: theme.textTheme.titleLarge
                    ?.copyWith(color: theme.colorScheme.primary)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(recTitle(context, rec),
                  style: theme.textTheme.titleMedium),
            ),
          ]),
          const SizedBox(height: 6),
          Text(recBody(context, rec)),
          const SizedBox(height: 8),
          Row(children: [
            if (factor != null) ...[
              Icon(factorIcon(factor.kind),
                  size: 16, color: theme.colorScheme.outline),
              const SizedBox(width: 4),
              Expanded(
                child: Text(factorName(context, factor.kind),
                    style: theme.textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis),
              ),
            ] else
              const Spacer(),
            TextButton.icon(
              onPressed: () => showWhySheet(context, rec),
              icon: const Icon(Icons.help_outline, size: 18),
              label: Text(l.why),
            ),
          ]),
        ],
      ),
    );
  }
}

/// FR-23: reason, rule ID and version, input values and evidence source.
void showWhySheet(BuildContext context, Recommendation r) {
  final l = context.l10n;
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (ctx) {
      final theme = Theme.of(ctx);
      Widget section(String title, Widget child) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: theme.textTheme.labelLarge
                        ?.copyWith(color: theme.colorScheme.primary)),
                const SizedBox(height: 4),
                child,
              ],
            ),
          );
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.75,
        maxChildSize: 0.95,
        builder: (ctx, controller) => ListView(
          controller: controller,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          children: [
            Text(l.whyTitle, style: theme.textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(recTitle(context, r), style: theme.textTheme.bodyMedium),
            const SizedBox(height: 16),
            section(l.whyReason, Text(recReason(context, r))),
            section(
              l.whyRule,
              Text('${l.ruleVersion(r.rule.id, r.rule.version)} · '
                  '${ruleStatus(context, r.rule.status)}'),
            ),
            section(
              l.whyInputs,
              Table(
                columnWidths: const {1: IntrinsicColumnWidth()},
                children: [
                  for (final e in r.inputs.entries)
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(inputLabel(context, e.key)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          fmt(context, e.value,
                              e.value == e.value.roundToDouble() ? 0 : 1),
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ]),
                ],
              ),
            ),
            section(l.whySource, Text(r.rule.source)),
          ],
        ),
      );
    },
  );
}
