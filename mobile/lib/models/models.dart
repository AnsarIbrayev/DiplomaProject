// Domain models of the prototype. In the full system these mirror the
// backend schema (DOA-17); here they live only in memory.

enum Sex { male, female }

enum ActivityLevel { low, moderate, high }

/// Study arm (FR-30, FR-31). In the pilot the arm is assigned by
/// randomization; the prototype lets the demo switch it in settings.
enum StudyArm { intervention, control }

class Profile {
  const Profile({
    required this.age,
    required this.sex,
    required this.heightCm,
    required this.weightKg,
    required this.waistCm,
    required this.activityLevel,
  });

  final int age;
  final Sex sex;
  final double heightCm;
  final double weightKg;
  final double waistCm;
  final ActivityLevel activityLevel;

  double get bmi => weightKg / ((heightCm / 100) * (heightCm / 100));

  Profile copyWith({double? weightKg, double? waistCm}) => Profile(
        age: age,
        sex: sex,
        heightCm: heightCm,
        weightKg: weightKg ?? this.weightKg,
        waistCm: waistCm ?? this.waistCm,
        activityLevel: activityLevel,
      );
}

/// Answers of the screening questionnaire (FR-04).
class ScreeningAnswers {
  const ScreeningAnswers({
    required this.age,
    required this.heightCm,
    required this.weightKg,
    this.diabetes = false,
    this.cardiovascular = false,
    this.pregnancy = false,
    this.weightLossMedication = false,
    this.parqPositive = false,
  });

  final int age;
  final double heightCm;
  final double weightKg;
  final bool diabetes;
  final bool cardiovascular;
  final bool pregnancy;
  final bool weightLossMedication;
  final bool parqPositive;

  double get bmi => weightKg / ((heightCm / 100) * (heightCm / 100));
}

/// Nutrient values per 100 g of a food.
class Food {
  const Food({
    required this.id,
    required this.names,
    required this.kcal,
    required this.proteinG,
    required this.fatG,
    required this.carbsG,
    required this.calciumMg,
    this.isFruitOrVegetable = false,
    this.isLocal = false,
    this.defaultPortionG = 100,
  });

  final String id;

  /// Names keyed by language code: 'kk', 'ru', 'en'.
  final Map<String, String> names;
  final double kcal;
  final double proteinG;
  final double fatG;
  final double carbsG;
  final double calciumMg;
  final bool isFruitOrVegetable;
  final bool isLocal;
  final double defaultPortionG;

  String name(String lang) => names[lang] ?? names['en']!;
}

class FoodEntry {
  const FoodEntry({required this.food, required this.grams, required this.day});

  final Food food;
  final double grams;

  /// Study day, 1-based (day 1 = onboarding day).
  final int day;

  double get kcal => food.kcal * grams / 100;
  double get proteinG => food.proteinG * grams / 100;
  double get fatG => food.fatG * grams / 100;
  double get carbsG => food.carbsG * grams / 100;
  double get calciumMg => food.calciumMg * grams / 100;
  double get fruitVegG => food.isFruitOrVegetable ? grams : 0;
}

class DayIntake {
  const DayIntake({
    this.kcal = 0,
    this.proteinG = 0,
    this.fatG = 0,
    this.carbsG = 0,
    this.calciumMg = 0,
    this.fruitVegG = 0,
  });

  final double kcal;
  final double proteinG;
  final double fatG;
  final double carbsG;
  final double calciumMg;
  final double fruitVegG;

  factory DayIntake.of(Iterable<FoodEntry> entries) {
    var k = 0.0, p = 0.0, f = 0.0, c = 0.0, ca = 0.0, fv = 0.0;
    for (final e in entries) {
      k += e.kcal;
      p += e.proteinG;
      f += e.fatG;
      c += e.carbsG;
      ca += e.calciumMg;
      fv += e.fruitVegG;
    }
    return DayIntake(
        kcal: k, proteinG: p, fatG: f, carbsG: c, calciumMg: ca, fruitVegG: fv);
  }

  /// Share of energy from each macronutrient (Atwater factors 4/9/4).
  double get proteinShare => _share(proteinG * 4);
  double get fatShare => _share(fatG * 9);
  double get carbsShare => _share(carbsG * 4);

  double _share(double kcalFromNutrient) {
    final total = proteinG * 4 + fatG * 9 + carbsG * 4;
    return total == 0 ? 0 : kcalFromNutrient / total;
  }
}

class Measurement {
  const Measurement({required this.day, required this.weightKg, this.waistCm});

  final int day;
  final double weightKg;
  final double? waistCm;
}

class CheckIn {
  const CheckIn({
    required this.day,
    required this.adverseEvent,
    required this.newExclusion,
  });

  final int day;
  final bool adverseEvent;
  final bool newExclusion;
}
