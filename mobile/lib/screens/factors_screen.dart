// Ranked factors with value, target and rule ID (FR-13, FR-14).

import 'package:flutter/material.dart';

import '../rules/rule_base.dart';
import '../widgets/common.dart';

class FactorsScreen extends StatelessWidget {
  const FactorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final app = context.app;
    final factors = app.factors;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(l.factorsIntro),
        const SizedBox(height: 12),
        if (app.targets.stepTarget == null)
          NoteBanner(text: l.baselineWeekFactors),
        for (var i = 0; i < factors.length; i++)
          _FactorCard(rank: i + 1, factor: factors[i]),
      ],
    );
  }
}

class _FactorCard extends StatelessWidget {
  const _FactorCard({required this.rank, required this.factor});

  final int rank;
  final Factor factor;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final (value, target) = factorValueAndTarget(context, factor);
    final color = factor.deviates ? scheme.error : scheme.primary;
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: color.withValues(alpha: 0.12),
              child: Text('$rank',
                  style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 10),
            Icon(factorIcon(factor.kind), color: color, size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: Text(factorName(context, factor.kind),
                  style: theme.textTheme.titleMedium),
            ),
            Text(
              factor.deviates
                  ? l.deviationPct(fmt(context, factor.score * 100))
                  : l.onTarget,
              style: theme.textTheme.labelMedium?.copyWith(color: color),
            ),
          ]),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: factor.score,
            minHeight: 6,
            color: color,
            backgroundColor: scheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(3),
          ),
          const SizedBox(height: 10),
          _Line(label: l.valueLabel, value: value),
          _Line(label: l.targetLabel, value: target),
          _Line(
            label: l.ruleLabel,
            value: '${factor.rule.id} v${factor.rule.version} · '
                '${groupName(context, factor.group)}',
          ),
        ],
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: Theme.of(context).textTheme.bodySmall),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
