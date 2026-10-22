// Synthetic demo profile for the prototype. No real person or participant
// data: the profile and the 14 days of logs are made up to show the
// screens, and the app labels them as demo data.

import '../models/models.dart';
import 'food_db.dart';

const demoToday = 14;

const demoProfile = Profile(
  age: 24,
  sex: Sex.male,
  heightCm: 178,
  weightKg: 91.1,
  waistCm: 100,
  activityLevel: ActivityLevel.low,
);

const demoScreening = ScreeningAnswers(age: 24, heightCm: 178, weightKg: 92.0);

/// Daily step counts. Day 14 is today and is still in progress.
const demoSteps = <int, int>{
  1: 4800, 2: 5200, 3: 4100, 4: 6300, 5: 5000, 6: 3900, 7: 5600, //
  8: 5100, 9: 5900, 10: 4700, 11: 6200, 12: 5400, 13: 4400, 14: 3200,
};

/// Prolonged sitting periods per day during active hours (SED-01).
const demoSittingPeriods = <int, int>{
  1: 3, 2: 4, 3: 3, 4: 2, 5: 4, 6: 5, 7: 3, //
  8: 3, 9: 2, 10: 4, 11: 3, 12: 3, 13: 4, 14: 2,
};

const demoMeasurements = <Measurement>[
  Measurement(day: 1, weightKg: 92.0, waistCm: 101),
  Measurement(day: 4, weightKg: 91.9),
  Measurement(day: 7, weightKg: 91.6, waistCm: 101),
  Measurement(day: 10, weightKg: 91.4),
  Measurement(day: 14, weightKg: 91.1, waistCm: 100),
];

const _menus = <List<(String, double)>>[
  [
    ('oatmeal', 250), ('egg', 110), ('tea', 250), ('plov', 400),
    ('rye_bread', 80), ('baursak', 120), ('tea', 250), ('chicken', 150),
    ('rice', 180), ('tomato', 120),
  ],
  [
    ('egg', 110), ('rye_bread', 80), ('tea', 250), ('beshbarmak', 450),
    ('baursak', 90), ('tea', 250), ('manty', 300), ('cucumber', 100),
  ],
  [
    ('buckwheat', 200), ('egg', 55), ('tea', 250), ('plov', 350),
    ('apple', 180), ('baursak', 120), ('chicken', 150), ('rice', 200),
  ],
];

List<FoodEntry> buildDemoFoodLog() {
  final entries = <FoodEntry>[];
  for (var day = 1; day <= demoToday; day++) {
    final menu = _menus[day % _menus.length];
    // Today only breakfast and lunch are logged so far.
    final items = day == demoToday ? menu.take(4) : menu;
    for (final (id, grams) in items) {
      entries.add(FoodEntry(food: foodById(id), grams: grams, day: day));
    }
  }
  return entries;
}
