// Demo food list of the prototype.
//
// The nutrient values are ILLUSTRATIVE ONLY: approximate per-100 g values
// typed in for the interface demo, not taken from a verified food
// composition table. Values for local dishes are rough placeholders. The
// real food database with sources, including locally consumed foods, is
// compiled in DOA-16 (FR-07). Do not use these numbers in the thesis.

import '../models/models.dart';

const foods = <Food>[
  Food(
    id: 'oatmeal',
    names: {'kk': 'Сұлы ботқасы (суда)', 'ru': 'Овсяная каша на воде', 'en': 'Oatmeal, cooked with water'},
    kcal: 71, proteinG: 2.5, fatG: 1.5, carbsG: 12, calciumMg: 9,
    defaultPortionG: 250,
  ),
  Food(
    id: 'buckwheat',
    names: {'kk': 'Қарақұмық ботқасы', 'ru': 'Гречка отварная', 'en': 'Buckwheat, boiled'},
    kcal: 92, proteinG: 3.4, fatG: 0.6, carbsG: 20, calciumMg: 7,
    defaultPortionG: 200,
  ),
  Food(
    id: 'rice',
    names: {'kk': 'Күріш (пісірілген)', 'ru': 'Рис отварной', 'en': 'White rice, boiled'},
    kcal: 130, proteinG: 2.7, fatG: 0.3, carbsG: 28, calciumMg: 10,
    defaultPortionG: 180,
  ),
  Food(
    id: 'egg',
    names: {'kk': 'Пісірілген жұмыртқа', 'ru': 'Яйцо варёное', 'en': 'Egg, boiled'},
    kcal: 155, proteinG: 12.6, fatG: 10.6, carbsG: 1.1, calciumMg: 50,
    defaultPortionG: 55,
  ),
  Food(
    id: 'chicken',
    names: {'kk': 'Тауық төсі (пісірілген)', 'ru': 'Куриная грудка отварная', 'en': 'Chicken breast, cooked'},
    kcal: 165, proteinG: 31, fatG: 3.6, carbsG: 0, calciumMg: 15,
    defaultPortionG: 150,
  ),
  Food(
    id: 'rye_bread',
    names: {'kk': 'Қара нан', 'ru': 'Хлеб ржаной', 'en': 'Rye bread'},
    kcal: 259, proteinG: 8.5, fatG: 3.3, carbsG: 48, calciumMg: 73,
    defaultPortionG: 40,
  ),
  Food(
    id: 'kefir',
    names: {'kk': 'Айран-кефир', 'ru': 'Кефир', 'en': 'Kefir'},
    kcal: 41, proteinG: 3.8, fatG: 1.0, carbsG: 4.5, calciumMg: 130,
    defaultPortionG: 250,
  ),
  Food(
    id: 'cottage_cheese',
    names: {'kk': 'Сүзбе', 'ru': 'Творог 2%', 'en': 'Cottage cheese, 2%'},
    kcal: 81, proteinG: 10.5, fatG: 2.3, carbsG: 4.8, calciumMg: 111,
    defaultPortionG: 150,
  ),
  Food(
    id: 'apple',
    names: {'kk': 'Алма', 'ru': 'Яблоко', 'en': 'Apple'},
    kcal: 52, proteinG: 0.3, fatG: 0.2, carbsG: 14, calciumMg: 6,
    isFruitOrVegetable: true, defaultPortionG: 180,
  ),
  Food(
    id: 'banana',
    names: {'kk': 'Банан', 'ru': 'Банан', 'en': 'Banana'},
    kcal: 89, proteinG: 1.1, fatG: 0.3, carbsG: 23, calciumMg: 5,
    isFruitOrVegetable: true, defaultPortionG: 120,
  ),
  Food(
    id: 'cucumber',
    names: {'kk': 'Қияр', 'ru': 'Огурец', 'en': 'Cucumber'},
    kcal: 15, proteinG: 0.7, fatG: 0.1, carbsG: 3.6, calciumMg: 16,
    isFruitOrVegetable: true, defaultPortionG: 120,
  ),
  Food(
    id: 'tomato',
    names: {'kk': 'Қызанақ', 'ru': 'Помидор', 'en': 'Tomato'},
    kcal: 18, proteinG: 0.9, fatG: 0.2, carbsG: 3.9, calciumMg: 10,
    isFruitOrVegetable: true, defaultPortionG: 120,
  ),
  Food(
    id: 'tea',
    names: {'kk': 'Шай (қантсыз)', 'ru': 'Чай без сахара', 'en': 'Tea, no sugar'},
    kcal: 1, proteinG: 0, fatG: 0, carbsG: 0.3, calciumMg: 0,
    defaultPortionG: 250,
  ),
  // Local dishes: placeholder values, to be replaced from a local food
  // composition source in DOA-16.
  Food(
    id: 'plov',
    names: {'kk': 'Палау', 'ru': 'Плов', 'en': 'Plov (pilaf)'},
    kcal: 190, proteinG: 7, fatG: 9, carbsG: 20, calciumMg: 15,
    isLocal: true, defaultPortionG: 300,
  ),
  Food(
    id: 'beshbarmak',
    names: {'kk': 'Бешбармақ', 'ru': 'Бешбармак', 'en': 'Beshbarmak'},
    kcal: 210, proteinG: 13, fatG: 11, carbsG: 15, calciumMg: 20,
    isLocal: true, defaultPortionG: 350,
  ),
  Food(
    id: 'baursak',
    names: {'kk': 'Бауырсақ', 'ru': 'Баурсаки', 'en': 'Baursak'},
    kcal: 380, proteinG: 8, fatG: 17, carbsG: 49, calciumMg: 30,
    isLocal: true, defaultPortionG: 60,
  ),
  Food(
    id: 'manty',
    names: {'kk': 'Мәнті', 'ru': 'Манты', 'en': 'Manty'},
    kcal: 220, proteinG: 10, fatG: 11, carbsG: 21, calciumMg: 25,
    isLocal: true, defaultPortionG: 250,
  ),
];

Food foodById(String id) => foods.firstWhere((f) => f.id == id);

List<Food> searchFoods(String query, String lang) {
  final q = query.trim().toLowerCase();
  if (q.isEmpty) return foods;
  return foods
      .where((f) => f.names.values.any((n) => n.toLowerCase().contains(q)))
      .toList()
    ..sort((a, b) => a.name(lang).compareTo(b.name(lang)));
}

/// Stand-in for AI-assisted food logging (FR-40). The real feature sends the
/// meal text or photo to an external AI service that may only propose foods
/// from this database. The prototype does NOT call any AI service: it
/// matches words of the description against food names, so that the
/// confirm-before-save flow can be shown.
List<Food> simulateAiProposal(String description) {
  final words = description
      .toLowerCase()
      .split(RegExp(r'[\s,.;+]+'))
      .where((w) => w.length >= 3)
      .toList();
  return foods
      .where((f) => f.names.values.any((n) {
            final name = n.toLowerCase();
            return words.any((w) =>
                name.contains(w) ||
                name.split(' ').any((part) =>
                    part.length >= 3 && w.startsWith(part.substring(0, 3))));
          }))
      .toList();
}
