// Prototype rule base (DOA-11).
//
// This is a client-side stand-in for the versioned rule base and Python
// evaluator of the full system (DOA-16, technology comparison D5). It exists
// so that the prototype can show real factor ranking, recommendations and
// explanations. Every rule carries its ID, version, evidence source and
// status. Status `team-set` marks a value chosen by the team as a placeholder
// (requirements, source code T); all values are to be confirmed when the rule
// base is formalised in DOA-16.

import 'dart:math' as math;

import '../models/models.dart';

enum RuleStatus { guideline, project, teamSet }

class Rule {
  const Rule({
    required this.id,
    required this.version,
    required this.source,
    required this.status,
  });

  final String id;
  final String version;

  /// Bibliographic source, kept in English in every language because it is
  /// a citation, not interface text.
  final String source;
  final RuleStatus status;
}

class Rules {
  static const eligibility = Rule(
    id: 'ELIG-01',
    version: '0.1',
    source: 'Project proposal, Section 3 (eligibility); EASO position '
        'statement, Hassapidou et al., Obes. Facts, 2023',
    status: RuleStatus.project,
  );

  static const bmi = Rule(
    id: 'BMI-01',
    version: '0.1',
    source: 'WHO, "Obesity and overweight", fact sheet (BMI classification)',
    status: RuleStatus.guideline,
  );

  static const energy = Rule(
    id: 'EN-01',
    version: '0.1',
    source: 'Mifflin et al., Am. J. Clin. Nutr. 51:241-247, 1990 (resting '
        'energy); FAO/WHO/UNU, Human energy requirements, 2004 (PAL); NICE '
        'CG189, 2014 (600 kcal/day deficit)',
    status: RuleStatus.guideline,
  );

  static const macros = Rule(
    id: 'MAC-01',
    version: '0.1',
    source: 'Institute of Medicine, Dietary Reference Intakes for Energy, '
        'Carbohydrate, Fiber, Fat, Fatty Acids, Cholesterol, Protein, and '
        'Amino Acids, 2005 (AMDR)',
    status: RuleStatus.guideline,
  );

  static const calcium = Rule(
    id: 'CA-01',
    version: '0.1',
    source: 'Institute of Medicine, Dietary Reference Intakes for Calcium '
        'and Vitamin D, 2011 (RDA)',
    status: RuleStatus.guideline,
  );

  static const fruitVeg = Rule(
    id: 'FV-01',
    version: '0.1',
    source: 'WHO/FAO, Diet, Nutrition and the Prevention of Chronic '
        'Diseases, WHO TRS 916, 2003 (at least 400 g/day)',
    status: RuleStatus.guideline,
  );

  static const steps = Rule(
    id: 'STEP-01',
    version: '0.1',
    source: 'Baseline-derived thresholds: Ikegaya et al., JMIR Hum. Factors, '
        '2025; weekly increase of 10% of baseline: team-set placeholder (T)',
    status: RuleStatus.teamSet,
  );

  static const resistance = Rule(
    id: 'PA-01',
    version: '0.1',
    source: 'WHO 2020 guidelines on physical activity and sedentary '
        'behaviour, Bull et al., Br. J. Sports Med. 54:1451-1462, 2020',
    status: RuleStatus.guideline,
  );

  static const sedentary = Rule(
    id: 'SED-01',
    version: '0.1',
    source: 'WHO 2020 guidelines (limit sedentary time), Bull et al., 2020; '
        '60-minute sitting threshold and limit of 2 periods/day: team-set '
        'placeholders (T)',
    status: RuleStatus.teamSet,
  );

  static const factorScore = Rule(
    id: 'FAC-01',
    version: '0.1',
    source: 'Relative deviation from the target range; scoring method: '
        'team-set placeholder (T), to be formalised in DOA-16',
    status: RuleStatus.teamSet,
  );

  static const all = [
    eligibility,
    bmi,
    energy,
    macros,
    calcium,
    fruitVeg,
    steps,
    resistance,
    sedentary,
    factorScore,
  ];
}

// ---------------------------------------------------------------------------
// Eligibility (FR-04, FR-05)
// ---------------------------------------------------------------------------

enum IneligibleReason {
  age,
  bmiLow,
  bmiHigh,
  diabetes,
  cardiovascular,
  pregnancy,
  medication,
  parq,
}

class EligibilityResult {
  const EligibilityResult(this.reasons);
  final List<IneligibleReason> reasons;
  bool get eligible => reasons.isEmpty;
}

EligibilityResult checkEligibility(ScreeningAnswers a) {
  final reasons = <IneligibleReason>[];
  if (a.age < 18 || a.age > 60) reasons.add(IneligibleReason.age);
  // BMI is compared after rounding to one decimal, as it is shown to the user.
  final bmi = (a.bmi * 10).round() / 10;
  if (bmi < 25.0) reasons.add(IneligibleReason.bmiLow);
  if (bmi > 34.9) reasons.add(IneligibleReason.bmiHigh);
  if (a.diabetes) reasons.add(IneligibleReason.diabetes);
  if (a.cardiovascular) reasons.add(IneligibleReason.cardiovascular);
  if (a.pregnancy) reasons.add(IneligibleReason.pregnancy);
  if (a.weightLossMedication) reasons.add(IneligibleReason.medication);
  if (a.parqPositive) reasons.add(IneligibleReason.parq);
  return EligibilityResult(reasons);
}

// ---------------------------------------------------------------------------
// Targets (FR-15, FR-16, FR-18, FR-20)
// ---------------------------------------------------------------------------

class Range {
  const Range(this.min, this.max);
  final double min;
  final double max;
  bool contains(double v) => v >= min && v <= max;
}

class Targets {
  const Targets({
    required this.restingKcal,
    required this.maintenanceKcal,
    required this.energyKcal,
    required this.energyRange,
    required this.calciumMg,
    required this.fruitVegG,
    required this.stepBaseline,
    required this.stepTarget,
    required this.week,
  });

  final double restingKcal;
  final double maintenanceKcal;
  final double energyKcal;
  final Range energyRange;
  final double calciumMg;
  final double fruitVegG;

  /// Null during the baseline week (FR-12).
  final double? stepBaseline;
  final double? stepTarget;
  final int week;

  static const proteinShare = Range(0.10, 0.35);
  static const fatShare = Range(0.20, 0.35);
  static const carbsShare = Range(0.45, 0.65);
}

/// Physical activity level by self-reported activity: lower bound of the
/// FAO/WHO/UNU (2004) lifestyle categories.
double physicalActivityLevel(ActivityLevel level) => switch (level) {
      ActivityLevel.low => 1.40,
      ActivityLevel.moderate => 1.70,
      ActivityLevel.high => 2.00,
    };

/// Mifflin-St Jeor resting energy expenditure, kcal/day.
double restingEnergy(Profile p) {
  final base = 10 * p.weightKg + 6.25 * p.heightCm - 5 * p.age;
  return p.sex == Sex.male ? base + 5 : base - 161;
}

double calciumRda(Profile p) {
  if (p.age <= 18) return 1300;
  if (p.age <= 50) return 1000;
  return p.sex == Sex.female ? 1200 : 1000;
}

const baselineDays = 7;
const weeklyStepIncrease = 0.10; // team-set placeholder (T)
const energyDeficitKcal = 600.0;
const energyTolerance = 0.10; // team-set placeholder (T)

int weekOfDay(int day) => (day - 1) ~/ 7 + 1;

double? stepBaseline(Map<int, int> stepsByDay) {
  final baseline = [
    for (var d = 1; d <= baselineDays; d++)
      if (stepsByDay[d] != null) stepsByDay[d]!
  ];
  if (baseline.length < baselineDays) return null;
  return baseline.reduce((a, b) => a + b) / baseline.length;
}

Targets computeTargets(Profile p, Map<int, int> stepsByDay, int today) {
  final ree = restingEnergy(p);
  final maintenance = ree * physicalActivityLevel(p.activityLevel);
  final energy = math.max(ree, maintenance - energyDeficitKcal);
  final week = weekOfDay(today);
  final baseline = today > baselineDays ? stepBaseline(stepsByDay) : null;
  final stepTarget =
      baseline == null ? null : baseline * (1 + weeklyStepIncrease * (week - 1));
  return Targets(
    restingKcal: ree,
    maintenanceKcal: maintenance,
    energyKcal: energy,
    energyRange:
        Range(energy * (1 - energyTolerance), energy * (1 + energyTolerance)),
    calciumMg: calciumRda(p),
    fruitVegG: 400,
    stepBaseline: baseline,
    stepTarget: stepTarget,
    week: week,
  );
}

// ---------------------------------------------------------------------------
// Hard constraints (FR-24, O2)
// ---------------------------------------------------------------------------

enum Constraint { energy, macros, calcium, intensity }

class ConstraintResult {
  const ConstraintResult(this.constraint, this.passed);
  final Constraint constraint;
  final bool passed;
}

List<ConstraintResult> checkHardConstraints(Targets t) => [
      // Energy target is never below resting energy expenditure.
      ConstraintResult(Constraint.energy, t.energyKcal >= t.restingKcal),
      // Macronutrient target ranges stay inside the AMDR.
      const ConstraintResult(Constraint.macros, true),
      // Calcium target is not below the RDA.
      ConstraintResult(Constraint.calcium, t.calciumMg >= 1000),
      // Activity is raised from the user's own baseline, never above the
      // weekly step defined in STEP-01.
      ConstraintResult(
        Constraint.intensity,
        t.stepTarget == null ||
            t.stepTarget! <=
                t.stepBaseline! * (1 + weeklyStepIncrease * (t.week - 1)) + 1,
      ),
    ];

// ---------------------------------------------------------------------------
// Factor identification (FR-13, FR-14)
// ---------------------------------------------------------------------------

enum FactorKind { energy, macros, calcium, fruitVeg, steps, sedentary }

enum FactorGroup { diet, activity, sedentary }

class Factor {
  const Factor({
    required this.kind,
    required this.value,
    required this.target,
    required this.score,
    required this.rule,
    this.detail,
  });

  final FactorKind kind;
  final double value;
  final Range target;

  /// Relative deviation from the target range, 0 (on target) to 1.
  final double score;
  final Rule rule;

  /// For macros: which nutrient deviates most ('protein', 'fat', 'carbs').
  final String? detail;

  FactorGroup get group => switch (kind) {
        FactorKind.steps => FactorGroup.activity,
        FactorKind.sedentary => FactorGroup.sedentary,
        _ => FactorGroup.diet,
      };

  bool get deviates => score > 0;
}

double relativeDeviation(double value, Range r) {
  if (value < r.min) return math.min(1, (r.min - value) / r.min);
  if (value > r.max) return math.min(1, (value - r.max) / r.max);
  return 0;
}

class WeekData {
  const WeekData({
    required this.intake,
    required this.meanSteps,
    required this.meanSittingPeriods,
  });

  /// Mean daily intake over the logged days of the last 7 days.
  final DayIntake intake;
  final double meanSteps;
  final double meanSittingPeriods;
}

List<Factor> computeFactors(Targets t, WeekData w) {
  final macroDevs = {
    'protein': relativeDeviation(w.intake.proteinShare, Targets.proteinShare),
    'fat': relativeDeviation(w.intake.fatShare, Targets.fatShare),
    'carbs': relativeDeviation(w.intake.carbsShare, Targets.carbsShare),
  };
  final worstMacro =
      macroDevs.entries.reduce((a, b) => b.value > a.value ? b : a);
  final macroValue = switch (worstMacro.key) {
    'protein' => w.intake.proteinShare,
    'fat' => w.intake.fatShare,
    _ => w.intake.carbsShare,
  };
  final macroRange = switch (worstMacro.key) {
    'protein' => Targets.proteinShare,
    'fat' => Targets.fatShare,
    _ => Targets.carbsShare,
  };

  final factors = <Factor>[
    Factor(
      kind: FactorKind.energy,
      value: w.intake.kcal,
      target: t.energyRange,
      score: relativeDeviation(w.intake.kcal, t.energyRange),
      rule: Rules.energy,
    ),
    Factor(
      kind: FactorKind.macros,
      value: macroValue,
      target: macroRange,
      score: worstMacro.value,
      rule: Rules.macros,
      detail: worstMacro.key,
    ),
    Factor(
      kind: FactorKind.calcium,
      value: w.intake.calciumMg,
      target: Range(t.calciumMg, double.infinity),
      score: relativeDeviation(
          w.intake.calciumMg, Range(t.calciumMg, double.infinity)),
      rule: Rules.calcium,
    ),
    Factor(
      kind: FactorKind.fruitVeg,
      value: w.intake.fruitVegG,
      target: Range(t.fruitVegG, double.infinity),
      score: relativeDeviation(
          w.intake.fruitVegG, Range(t.fruitVegG, double.infinity)),
      rule: Rules.fruitVeg,
    ),
    if (t.stepTarget != null)
      Factor(
        kind: FactorKind.steps,
        value: w.meanSteps,
        target: Range(t.stepTarget!, double.infinity),
        score: relativeDeviation(
            w.meanSteps, Range(t.stepTarget!, double.infinity)),
        rule: Rules.steps,
      ),
    Factor(
      kind: FactorKind.sedentary,
      value: w.meanSittingPeriods,
      target: const Range(0, 2),
      score: relativeDeviation(w.meanSittingPeriods, const Range(0, 2)),
      rule: Rules.sedentary,
    ),
  ];
  // Stable sort: highest deviation first; ties keep the order above.
  final indexed = factors.asMap().entries.toList()
    ..sort((a, b) {
      final c = b.value.score.compareTo(a.value.score);
      return c != 0 ? c : a.key.compareTo(b.key);
    });
  return [for (final e in indexed) e.value];
}

// ---------------------------------------------------------------------------
// Recommendations (FR-22, FR-23)
// ---------------------------------------------------------------------------

enum RecKind {
  reduceEnergy,
  increaseEnergy,
  balanceMacros,
  calcium,
  fruitVeg,
  steps,
  resistance,
  sittingBreaks,
}

class Recommendation {
  const Recommendation({
    required this.kind,
    required this.factor,
    required this.rule,
    required this.inputs,
  });

  final RecKind kind;

  /// The factor this recommendation addresses; null for plan items that do
  /// not come from a deviation (resistance training, FR-20).
  final Factor? factor;
  final Rule rule;

  /// Input values used by the rule, keyed by an input name that the UI
  /// localizes. Shown in the "Why?" explanation (FR-23).
  final Map<String, double> inputs;
}

List<Recommendation> generateRecommendations(
  Profile p,
  Targets t,
  List<Factor> rankedFactors, {
  bool activitySuspended = false,
}) {
  final recs = <Recommendation>[];
  for (final f in rankedFactors.where((f) => f.deviates)) {
    switch (f.kind) {
      case FactorKind.energy:
        recs.add(Recommendation(
          kind: f.value > f.target.max
              ? RecKind.reduceEnergy
              : RecKind.increaseEnergy,
          factor: f,
          rule: f.rule,
          inputs: {
            'weight': p.weightKg,
            'height': p.heightCm,
            'age': p.age.toDouble(),
            'pal': physicalActivityLevel(p.activityLevel),
            'intakeKcal': f.value,
            'targetKcal': t.energyKcal,
          },
        ));
      case FactorKind.macros:
        recs.add(Recommendation(
          kind: RecKind.balanceMacros,
          factor: f,
          rule: f.rule,
          inputs: {
            'sharePct': f.value * 100,
            'minPct': f.target.min * 100,
            'maxPct': f.target.max * 100,
          },
        ));
      case FactorKind.calcium:
        recs.add(Recommendation(
          kind: RecKind.calcium,
          factor: f,
          rule: f.rule,
          inputs: {
            'age': p.age.toDouble(),
            'calciumMg': f.value,
            'targetMg': t.calciumMg,
          },
        ));
      case FactorKind.fruitVeg:
        recs.add(Recommendation(
          kind: RecKind.fruitVeg,
          factor: f,
          rule: f.rule,
          inputs: {'fruitVegG': f.value, 'targetG': t.fruitVegG},
        ));
      case FactorKind.steps:
        if (activitySuspended) break;
        recs.add(Recommendation(
          kind: RecKind.steps,
          factor: f,
          rule: f.rule,
          inputs: {
            'baselineSteps': t.stepBaseline!,
            'week': t.week.toDouble(),
            'meanSteps': f.value,
            'targetSteps': t.stepTarget!,
          },
        ));
        recs.add(Recommendation(
          kind: RecKind.resistance,
          factor: null,
          rule: Rules.resistance,
          inputs: {'sessionsPerWeek': 2},
        ));
      case FactorKind.sedentary:
        if (activitySuspended) break;
        recs.add(Recommendation(
          kind: RecKind.sittingBreaks,
          factor: f,
          rule: f.rule,
          inputs: {'sittingPeriods': f.value, 'maxPeriods': f.target.max},
        ));
    }
  }
  if (!activitySuspended && !recs.any((r) => r.kind == RecKind.resistance)) {
    recs.add(const Recommendation(
      kind: RecKind.resistance,
      factor: null,
      rule: Rules.resistance,
      inputs: {'sessionsPerWeek': 2},
    ));
  }
  return recs;
}
