import 'package:flutter_test/flutter_test.dart';
import 'package:weight_assistant/data/food_db.dart';
import 'package:weight_assistant/models/models.dart';
import 'package:weight_assistant/rules/rule_base.dart';
import 'package:weight_assistant/state/app_state.dart';

ScreeningAnswers answers({int age = 30, double bmi = 28}) {
  // Height 1.70 m, weight chosen to give the requested BMI.
  return ScreeningAnswers(age: age, heightCm: 170, weightKg: bmi * 1.7 * 1.7);
}

void main() {
  group('FR-04 eligibility boundaries', () {
    final cases = <(int, double, bool)>[
      (17, 28, false),
      (18, 28, true),
      (60, 28, true),
      (61, 28, false),
      (30, 24.9, false),
      (30, 25.0, true),
      (30, 34.9, true),
      (30, 35.0, false),
    ];
    for (final (age, bmi, expected) in cases) {
      test('age $age, BMI $bmi -> eligible: $expected', () {
        expect(checkEligibility(answers(age: age, bmi: bmi)).eligible,
            expected);
      });
    }

    test('each exclusion condition makes the person ineligible', () {
      const base = ScreeningAnswers(age: 30, heightCm: 170, weightKg: 80);
      expect(checkEligibility(base).eligible, isTrue);
      for (final a in [
        const ScreeningAnswers(
            age: 30, heightCm: 170, weightKg: 80, diabetes: true),
        const ScreeningAnswers(
            age: 30, heightCm: 170, weightKg: 80, cardiovascular: true),
        const ScreeningAnswers(
            age: 30, heightCm: 170, weightKg: 80, pregnancy: true),
        const ScreeningAnswers(
            age: 30, heightCm: 170, weightKg: 80, weightLossMedication: true),
        const ScreeningAnswers(
            age: 30, heightCm: 170, weightKg: 80, parqPositive: true),
      ]) {
        expect(checkEligibility(a).eligible, isFalse);
      }
    });
  });

  group('targets', () {
    const p = Profile(
      age: 24,
      sex: Sex.male,
      heightCm: 178,
      weightKg: 92,
      waistCm: 101,
      activityLevel: ActivityLevel.low,
    );

    test('Mifflin-St Jeor resting energy', () {
      // 10*92 + 6.25*178 - 5*24 + 5
      expect(restingEnergy(p), closeTo(1917.5, 0.01));
    });

    test('no step target during the baseline week (FR-12)', () {
      final steps = {for (var d = 1; d <= 7; d++) d: 5000};
      expect(computeTargets(p, steps, 7).stepTarget, isNull);
      expect(computeTargets(p, steps, 8).stepTarget, closeTo(5500, 0.01));
    });

    test('step target is never below the baseline (FR-18)', () {
      final steps = {for (var d = 1; d <= 7; d++) d: 5000};
      for (var day = 8; day <= 84; day++) {
        final t = computeTargets(p, steps, day);
        expect(t.stepTarget!, greaterThanOrEqualTo(t.stepBaseline!));
      }
    });

    test('hard constraints pass for the demo profile (FR-24)', () {
      final steps = {for (var d = 1; d <= 7; d++) d: 5000};
      final results = checkHardConstraints(computeTargets(p, steps, 14));
      expect(results.every((r) => r.passed), isTrue);
    });
  });

  group('demo profile', () {
    final state = AppState();

    test('factors are ranked by deviation (FR-14)', () {
      final f = state.factors;
      for (var i = 1; i < f.length; i++) {
        expect(f[i - 1].score, greaterThanOrEqualTo(f[i].score));
      }
    });

    test('first recommendation addresses the top factor (FR-22)', () {
      expect(state.recommendations.first.factor!.kind, state.factors.first.kind);
    });

    test('every recommendation has an explanation (FR-23)', () {
      for (final r in state.recommendations) {
        expect(r.rule.id, isNotEmpty);
        expect(r.rule.version, isNotEmpty);
        expect(r.rule.source, isNotEmpty);
        expect(r.inputs, isNotEmpty);
      }
    });

    test('adverse event suspends activity recommendations (FR-29)', () {
      final s = AppState()
        ..submitCheckIn(adverseEvent: true, newExclusion: false);
      expect(
          s.recommendations.where((r) =>
              r.kind == RecKind.steps ||
              r.kind == RecKind.resistance ||
              r.kind == RecKind.sittingBreaks),
          isEmpty);
    });
  });

  test('simulated AI proposal only returns foods from the database (FR-40)',
      () {
    final proposal = simulateAiProposal('плов и чай без сахара, хлеб');
    expect(proposal, isNotEmpty);
    expect(proposal.every(foods.contains), isTrue);
    expect(proposal.map((f) => f.id), containsAll(['plov', 'tea']));
  });
}
