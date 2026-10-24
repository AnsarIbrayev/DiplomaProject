import 'package:flutter/widgets.dart';

import '../data/demo_data.dart';
import '../models/models.dart';
import '../rules/rule_base.dart';

enum Stage { language, consent, screening, result, app }

/// In-memory state of the prototype. The full client keeps this in a local
/// SQLite database and synchronizes it with the backend (DOA-17, DOA-19).
class AppState extends ChangeNotifier {
  AppState() {
    _loadDemo();
  }

  Locale locale = const Locale('ru');
  Stage stage = Stage.language;
  StudyArm arm = StudyArm.intervention;
  bool consentGiven = false;
  EligibilityResult? eligibility;
  ScreeningAnswers screening = demoScreening;
  bool activitySuspended = false;

  late Profile profile;
  late int today;
  late Map<int, int> steps;
  late Map<int, int> sittingPeriods;
  late List<FoodEntry> foodLog;
  late List<Measurement> measurements;
  final List<CheckIn> checkIns = [];

  void _loadDemo() {
    profile = demoProfile;
    today = demoToday;
    steps = Map.of(demoSteps);
    sittingPeriods = Map.of(demoSittingPeriods);
    foodLog = buildDemoFoodLog();
    measurements = List.of(demoMeasurements);
    checkIns.clear();
    activitySuspended = false;
  }

  String get lang => locale.languageCode;

  /// Screen requested by a demo link; read once by [HomeShell].
  String? demoScreen;

  void applyDemoLink(Map<String, String> params) {
    final lang = params['lang'];
    if (lang == 'kk' || lang == 'ru' || lang == 'en') locale = Locale(lang!);
    if (params['arm'] == 'control') arm = StudyArm.control;
    final screen = params['screen'];
    switch (screen) {
      case null || 'language':
        return;
      case 'consent':
        stage = Stage.consent;
      case 'screening':
        consentGiven = true;
        stage = Stage.screening;
      case 'eligible':
        consentGiven = true;
        submitScreening(demoScreening);
      case 'ineligible':
        consentGiven = true;
        submitScreening(const ScreeningAnswers(
            age: 45, heightCm: 165, weightKg: 98, diabetes: true));
      default:
        consentGiven = true;
        eligibility = checkEligibility(demoScreening);
        stage = Stage.app;
        demoScreen = screen;
    }
  }

  void setLocale(Locale l) {
    locale = l;
    notifyListeners();
  }

  void goTo(Stage s) {
    stage = s;
    notifyListeners();
  }

  void giveConsent() {
    consentGiven = true;
    stage = Stage.screening;
    notifyListeners();
  }

  void submitScreening(ScreeningAnswers answers) {
    screening = answers;
    eligibility = checkEligibility(answers);
    stage = Stage.result;
    notifyListeners();
  }

  void setArm(StudyArm a) {
    arm = a;
    notifyListeners();
  }

  void restartDemo() {
    _loadDemo();
    consentGiven = false;
    eligibility = null;
    screening = demoScreening;
    stage = Stage.language;
    notifyListeners();
  }

  void addFood(Food food, double grams) {
    foodLog.add(FoodEntry(food: food, grams: grams, day: today));
    notifyListeners();
  }

  void removeFood(FoodEntry entry) {
    foodLog.remove(entry);
    notifyListeners();
  }

  void addMeasurement(double weightKg, double? waistCm) {
    measurements.removeWhere((m) => m.day == today);
    measurements.add(
        Measurement(day: today, weightKg: weightKg, waistCm: waistCm));
    profile = profile.copyWith(weightKg: weightKg, waistCm: waistCm);
    notifyListeners();
  }

  void submitCheckIn({required bool adverseEvent, required bool newExclusion}) {
    checkIns.add(CheckIn(
        day: today, adverseEvent: adverseEvent, newExclusion: newExclusion));
    // FR-29: suspend activity recommendations and prompts.
    if (adverseEvent || newExclusion) activitySuspended = true;
    notifyListeners();
  }

  // --- Derived data -------------------------------------------------------

  bool get isIntervention => arm == StudyArm.intervention;

  bool get checkInDue =>
      checkIns.isEmpty || today - checkIns.last.day >= 7;

  List<FoodEntry> entriesOf(int day) =>
      foodLog.where((e) => e.day == day).toList();

  DayIntake intakeOf(int day) => DayIntake.of(entriesOf(day));

  Targets get targets => computeTargets(profile, steps, today);

  /// The last 7 completed days (today is still in progress).
  List<int> get lastWeekDays =>
      [for (var d = today - 7; d < today; d++) if (d >= 1) d];

  WeekData get weekData {
    final days = lastWeekDays;
    final intakes = days.map(intakeOf).toList();
    double mean(Iterable<double> xs) =>
        xs.isEmpty ? 0 : xs.reduce((a, b) => a + b) / xs.length;
    return WeekData(
      intake: DayIntake(
        kcal: mean(intakes.map((i) => i.kcal)),
        proteinG: mean(intakes.map((i) => i.proteinG)),
        fatG: mean(intakes.map((i) => i.fatG)),
        carbsG: mean(intakes.map((i) => i.carbsG)),
        calciumMg: mean(intakes.map((i) => i.calciumMg)),
        fruitVegG: mean(intakes.map((i) => i.fruitVegG)),
      ),
      meanSteps: mean(days.map((d) => (steps[d] ?? 0).toDouble())),
      meanSittingPeriods:
          mean(days.map((d) => (sittingPeriods[d] ?? 0).toDouble())),
    );
  }

  List<Factor> get factors => computeFactors(targets, weekData);

  List<Recommendation> get recommendations => generateRecommendations(
        profile,
        targets,
        factors,
        activitySuspended: activitySuspended,
      );
}

class AppScope extends InheritedNotifier<AppState> {
  const AppScope({super.key, required AppState state, required super.child})
      : super(notifier: state);

  static AppState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppScope>()!.notifier!;
}
