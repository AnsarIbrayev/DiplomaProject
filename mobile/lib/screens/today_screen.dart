// Daily dashboard: today's intake and steps against targets, the main
// factor and the first recommendation, prompt example (FR-25) and the
// weekly check-in reminder (FR-28).

import 'package:flutter/material.dart';

import '../widgets/common.dart';
import 'checkin_screen.dart';
import 'home_shell.dart';
import 'plan_screen.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key, required this.onOpen});

  final void Function(HomeTab) onOpen;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final app = context.app;
    final theme = Theme.of(context);
    final t = app.targets;
    final intake = app.intakeOf(app.today);
    final stepsToday = (app.steps[app.today] ?? 0).toDouble();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(l.dayOfStudy(app.today, t.week),
            style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        if (app.activitySuspended)
          NoteBanner(text: l.suspendedBanner, warning: true),
        if (app.checkInDue)
          SectionCard(
            color: theme.colorScheme.primaryContainer,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const CheckInScreen())),
            child: Row(children: [
              const Icon(Icons.assignment_outlined),
              const SizedBox(width: 12),
              Expanded(child: Text(l.checkInDue)),
              Text(l.checkInOpen,
                  style: TextStyle(color: theme.colorScheme.primary)),
            ]),
          ),
        Row(children: [
          Expanded(
            child: _MetricCard(
              icon: Icons.local_fire_department_outlined,
              title: l.energyToday,
              value: '${fmt(context, intake.kcal)} ${l.kcal}',
              target: app.isIntervention ? t.energyKcal : null,
              current: intake.kcal,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _MetricCard(
              icon: Icons.directions_walk,
              title: l.stepsToday,
              value: fmt(context, stepsToday),
              target: app.isIntervention && !app.activitySuspended
                  ? t.stepTarget
                  : null,
              current: stepsToday,
            ),
          ),
        ]),
        const SizedBox(height: 12),
        if (!app.isIntervention)
          NoteBanner(text: l.controlTodayNote)
        else ...[
          if (!app.activitySuspended && t.stepTarget != null)
            SectionCard(
              color: theme.colorScheme.secondaryContainer,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.notifications_active_outlined),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l.promptTitle, style: theme.textTheme.titleSmall),
                        const SizedBox(height: 4),
                        Text(l.promptBody),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          _TopFactorCard(onOpen: onOpen),
          _TopRecommendationCard(onOpen: onOpen),
        ],
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.current,
    this.target,
  });

  final IconData icon;
  final String title;
  final String value;
  final double current;
  final double? target;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon, size: 18, color: theme.colorScheme.primary),
            const SizedBox(width: 6),
            Expanded(
                child: Text(title,
                    style: theme.textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis)),
          ]),
          const SizedBox(height: 8),
          Text(value, style: theme.textTheme.headlineSmall),
          if (target != null) ...[
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: (current / target!).clamp(0, 1).toDouble(),
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
            const SizedBox(height: 4),
            Text(context.l10n.ofTarget(fmt(context, target!)),
                style: theme.textTheme.bodySmall),
          ],
        ],
      ),
    );
  }
}

class _TopFactorCard extends StatelessWidget {
  const _TopFactorCard({required this.onOpen});

  final void Function(HomeTab) onOpen;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final f = context.app.factors.first;
    final (value, target) = factorValueAndTarget(context, f);
    return SectionCard(
      onTap: () => onOpen(HomeTab.factors),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l.topFactor, style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Row(children: [
            Icon(factorIcon(f.kind), color: theme.colorScheme.error),
            const SizedBox(width: 8),
            Expanded(
                child: Text(factorName(context, f.kind),
                    style: theme.textTheme.titleMedium)),
          ]),
          const SizedBox(height: 4),
          Text('${l.valueLabel}: $value · ${l.targetLabel}: $target'),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () => onOpen(HomeTab.factors),
                child: Text(l.seeAllFactors)),
          ),
        ],
      ),
    );
  }
}

class _TopRecommendationCard extends StatelessWidget {
  const _TopRecommendationCard({required this.onOpen});

  final void Function(HomeTab) onOpen;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final recs = context.app.recommendations;
    if (recs.isEmpty) return const SizedBox.shrink();
    final r = recs.first;
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l.topRecommendation, style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Text(recTitle(context, r), style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(recBody(context, r)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () => showWhySheet(context, r),
                icon: const Icon(Icons.help_outline, size: 18),
                label: Text(l.why),
              ),
              FilledButton.tonal(
                  onPressed: () => onOpen(HomeTab.plan),
                  child: Text(l.openPlan)),
            ],
          ),
        ],
      ),
    );
  }
}
