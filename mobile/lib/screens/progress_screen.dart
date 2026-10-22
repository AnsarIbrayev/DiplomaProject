// Weight trend, daily steps and daily intake (FR-27). The control arm sees
// the same charts without targets (FR-31).

import 'package:flutter/material.dart';

import '../rules/rule_base.dart';
import '../widgets/charts.dart';
import '../widgets/common.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final app = context.app;
    final theme = Theme.of(context);
    final t = app.targets;
    final days = [for (var d = 1; d <= app.today; d++) d];
    final weights = app.measurements.toList()
      ..sort((a, b) => a.day.compareTo(b.day));
    final change = weights.isEmpty
        ? 0.0
        : weights.last.weightKg - weights.first.weightKg;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l.weightTrend, style: theme.textTheme.titleSmall),
              const SizedBox(height: 4),
              Text(
                l.weightChange(
                    '${change > 0 ? '+' : ''}${fmt(context, change, 1)}'),
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 140,
                child: LineChart(
                  points: [
                    for (final m in weights) (m.day.toDouble(), m.weightKg)
                  ],
                  xMax: app.today.toDouble(),
                  color: theme.colorScheme.primary,
                  label: (v) => fmt(context, v, 1),
                ),
              ),
            ],
          ),
        ),
        SectionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l.stepsChart, style: theme.textTheme.titleSmall),
              const SizedBox(height: 12),
              SizedBox(
                height: 140,
                child: BarChart(
                  values: [for (final d in days) (app.steps[d] ?? 0).toDouble()],
                  target: app.isIntervention ? t.stepTarget : null,
                  highlightFirst: baselineDays,
                  color: theme.colorScheme.primary,
                  mutedColor: theme.colorScheme.outlineVariant,
                  targetColor: theme.colorScheme.error,
                  label: (v) => fmt(context, v),
                ),
              ),
              const SizedBox(height: 8),
              _Legend(
                items: [
                  (theme.colorScheme.outlineVariant, l.baselineLabel),
                  if (app.isIntervention && t.stepTarget != null)
                    (theme.colorScheme.error, l.targetLine),
                ],
              ),
            ],
          ),
        ),
        SectionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l.intakeChart, style: theme.textTheme.titleSmall),
              const SizedBox(height: 12),
              SizedBox(
                height: 140,
                child: BarChart(
                  values: [for (final d in days) app.intakeOf(d).kcal],
                  target: app.isIntervention ? t.energyKcal : null,
                  color: theme.colorScheme.tertiary,
                  mutedColor: theme.colorScheme.outlineVariant,
                  targetColor: theme.colorScheme.error,
                  label: (v) => fmt(context, v),
                ),
              ),
              if (app.isIntervention) ...[
                const SizedBox(height: 8),
                _Legend(items: [(theme.colorScheme.error, l.targetLine)]),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({required this.items});

  final List<(Color, String)> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: [
        for (final (color, text) in items)
          Row(mainAxisSize: MainAxisSize.min, children: [
            Container(width: 12, height: 12, color: color),
            const SizedBox(width: 4),
            Text(text, style: Theme.of(context).textTheme.bodySmall),
          ]),
      ],
    );
  }
}
