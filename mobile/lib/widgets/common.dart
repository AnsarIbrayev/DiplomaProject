import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/app_localizations.dart';
import '../rules/rule_base.dart';
import '../state/app_state.dart';

extension ContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  AppState get app => AppScope.of(this);
}

/// Formats a number for the current interface language.
String fmt(BuildContext context, double value, [int decimals = 0]) {
  final locale = Localizations.localeOf(context).languageCode;
  final f = NumberFormat.decimalPatternDigits(
      locale: locale, decimalDigits: decimals);
  return f.format(value);
}

class DemoBadge extends StatelessWidget {
  const DemoBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: scheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        context.l10n.demoBadge,
        style: TextStyle(fontSize: 12, color: scheme.onTertiaryContainer),
      ),
    );
  }
}

/// Full-width strip under the app bar that marks the demo data.
class DemoStrip extends StatelessWidget {
  const DemoStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      height: 24,
      alignment: Alignment.center,
      color: scheme.tertiaryContainer,
      child: Text(
        context.l10n.demoBadge,
        style: TextStyle(fontSize: 12, color: scheme.onTertiaryContainer),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  const SectionCard({super.key, required this.child, this.color, this.onTap});

  final Widget child;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color ?? Theme.of(context).colorScheme.surfaceContainerLow,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(padding: const EdgeInsets.all(16), child: child),
      ),
    );
  }
}

class NoteBanner extends StatelessWidget {
  const NoteBanner({super.key, required this.text, this.icon, this.warning = false});

  final String text;
  final IconData? icon;
  final bool warning;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg = warning ? scheme.errorContainer : scheme.secondaryContainer;
    final fg = warning ? scheme.onErrorContainer : scheme.onSecondaryContainer;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: bg, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon ?? (warning ? Icons.warning_amber : Icons.info_outline),
              size: 20, color: fg),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: TextStyle(color: fg))),
        ],
      ),
    );
  }
}

// --- Localized labels for rule-engine values -------------------------------

String factorName(BuildContext context, FactorKind k) {
  final l = context.l10n;
  return switch (k) {
    FactorKind.energy => l.factorEnergy,
    FactorKind.macros => l.factorMacros,
    FactorKind.calcium => l.factorCalcium,
    FactorKind.fruitVeg => l.factorFruitVeg,
    FactorKind.steps => l.factorSteps,
    FactorKind.sedentary => l.factorSedentary,
  };
}

IconData factorIcon(FactorKind k) => switch (k) {
      FactorKind.energy => Icons.local_fire_department_outlined,
      FactorKind.macros => Icons.pie_chart_outline,
      FactorKind.calcium => Icons.water_drop_outlined,
      FactorKind.fruitVeg => Icons.eco_outlined,
      FactorKind.steps => Icons.directions_walk,
      FactorKind.sedentary => Icons.event_seat_outlined,
    };

String groupName(BuildContext context, FactorGroup g) {
  final l = context.l10n;
  return switch (g) {
    FactorGroup.diet => l.groupDiet,
    FactorGroup.activity => l.groupActivity,
    FactorGroup.sedentary => l.groupSedentary,
  };
}

String macroName(BuildContext context, String? key) {
  final l = context.l10n;
  return switch (key) {
    'protein' => l.macroProtein,
    'fat' => l.macroFat,
    _ => l.macroCarbs,
  };
}

/// Value and target of a factor as text, with units.
(String, String) factorValueAndTarget(BuildContext context, Factor f) {
  final l = context.l10n;
  String n(double v, [int d = 0]) => fmt(context, v, d);
  return switch (f.kind) {
    FactorKind.energy => (
        '${n(f.value)} ${l.kcal}',
        '${n(f.target.min)}–${n(f.target.max)} ${l.kcal}'
      ),
    FactorKind.macros => (
        '${macroName(context, f.detail)} ${n(f.value * 100)}%',
        '${n(f.target.min * 100)}–${n(f.target.max * 100)}%'
      ),
    FactorKind.calcium => (
        '${n(f.value)} ${l.mg}',
        l.atLeast('${n(f.target.min)} ${l.mg}')
      ),
    FactorKind.fruitVeg => (
        '${n(f.value)} ${l.g}',
        l.atLeast('${n(f.target.min)} ${l.g}')
      ),
    FactorKind.steps => (
        '${n(f.value)} ${l.steps}',
        l.atLeast('${n(f.target.min)} ${l.steps}')
      ),
    FactorKind.sedentary => (
        '${n(f.value, 1)} ${l.periodsPerDay}',
        l.atMost('${n(f.target.max)} ${l.periodsPerDay}')
      ),
  };
}

String recTitle(BuildContext context, Recommendation r) {
  final l = context.l10n;
  final t = context.app.targets;
  String n(double v, [int d = 0]) => fmt(context, v, d);
  return switch (r.kind) {
    RecKind.reduceEnergy => l.recReduceEnergyTitle(n(t.energyKcal)),
    RecKind.increaseEnergy => l.recIncreaseEnergyTitle(n(t.energyKcal)),
    RecKind.balanceMacros =>
      l.recMacrosTitle(macroName(context, r.factor?.detail)),
    RecKind.calcium => l.recCalciumTitle(n(t.calciumMg)),
    RecKind.fruitVeg => l.recFruitVegTitle(n(t.fruitVegG)),
    RecKind.steps => l.recStepsTitle(n(t.stepTarget ?? 0)),
    RecKind.resistance => l.recResistanceTitle,
    RecKind.sittingBreaks => l.recSittingTitle,
  };
}

String recBody(BuildContext context, Recommendation r) {
  final l = context.l10n;
  String n(double v, [int d = 0]) => fmt(context, v, d);
  final f = r.factor;
  return switch (r.kind) {
    RecKind.reduceEnergy => l.recReduceEnergyBody(n(f!.value)),
    RecKind.increaseEnergy => l.recIncreaseEnergyBody(n(f!.value)),
    RecKind.balanceMacros => l.recMacrosBody(
        _capitalize(macroName(context, f!.detail)),
        n(f.value * 100),
        n(f.target.min * 100),
        n(f.target.max * 100)),
    RecKind.calcium => l.recCalciumBody(n(f!.value)),
    RecKind.fruitVeg => l.recFruitVegBody(n(f!.value)),
    RecKind.steps =>
      l.recStepsBody(n(r.inputs['baselineSteps']!), n(f!.value)),
    RecKind.resistance => l.recResistanceBody,
    RecKind.sittingBreaks => l.recSittingBody(n(f!.value, 1)),
  };
}

String recReason(BuildContext context, Recommendation r) {
  final l = context.l10n;
  return switch (r.kind) {
    RecKind.reduceEnergy || RecKind.increaseEnergy => l.whyReasonEnergy,
    RecKind.balanceMacros => l.whyReasonMacros,
    RecKind.calcium => l.whyReasonCalcium,
    RecKind.fruitVeg => l.whyReasonFruitVeg,
    RecKind.steps => l.whyReasonSteps,
    RecKind.resistance => l.whyReasonResistance,
    RecKind.sittingBreaks => l.whyReasonSitting,
  };
}

String inputLabel(BuildContext context, String key) {
  final l = context.l10n;
  return switch (key) {
    'weight' => l.inWeight,
    'height' => l.inHeight,
    'age' => l.inAge,
    'pal' => l.inPal,
    'intakeKcal' => l.inIntakeKcal,
    'targetKcal' => l.inTargetKcal,
    'sharePct' => l.inSharePct,
    'minPct' => l.inMinPct,
    'maxPct' => l.inMaxPct,
    'calciumMg' => l.inCalciumMg,
    'targetMg' => l.inTargetMg,
    'fruitVegG' => l.inFruitVegG,
    'targetG' => l.inTargetG,
    'baselineSteps' => l.inBaselineSteps,
    'week' => l.inWeek,
    'meanSteps' => l.inMeanSteps,
    'targetSteps' => l.inTargetSteps,
    'sessionsPerWeek' => l.inSessionsPerWeek,
    'sittingPeriods' => l.inSittingPeriods,
    'maxPeriods' => l.inMaxPeriods,
    _ => key,
  };
}

String ruleStatus(BuildContext context, RuleStatus s) {
  final l = context.l10n;
  return switch (s) {
    RuleStatus.guideline => l.statusGuideline,
    RuleStatus.project => l.statusProject,
    RuleStatus.teamSet => l.statusTeamSet,
  };
}

String _capitalize(String s) =>
    s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
