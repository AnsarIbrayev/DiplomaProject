# Mobile client (Flutter)

Clickable prototype of the mobile recommender system (pre-defense item 8, [DOA-11](https://yeralytemir.youtrack.cloud/issue/DOA-11)). Screens, use-case mapping, demo data status and the prototype rule base are described in [docs/prototype](../docs/prototype/README.md).

## Run

Online demo without installation: [web build of the prototype](https://claude.ai/artifact/R7UrdujHwhD1bVwGGv4BXE).


```bash
flutter pub get
flutter run -d chrome   # browser
flutter run             # Android (9+) or iOS (15+) device or emulator
flutter test            # unit, widget and localization tests
```

## Structure

| Path | Contents |
|---|---|
| `lib/main.dart` | App entry, localization setup, demo links (`?screen=...&lang=...`) |
| `lib/models/` | Domain models (profile, food, logs, check-ins) |
| `lib/rules/rule_base.dart` | Prototype rule base: eligibility, targets, factors, recommendations, hard constraints |
| `lib/data/` | Synthetic demo profile and illustrative food list (not real data) |
| `lib/state/app_state.dart` | In-memory app state |
| `lib/screens/` | Onboarding, Today, Log, Factors, Plan, Progress, Check-in, Settings |
| `lib/l10n/` | Interface texts: `app_kk.arb`, `app_ru.arb`, `app_en.arb` (NFR-19) |
| `test/` | Rule tests (FR-04, FR-12, FR-18, FR-22–FR-24, FR-29, FR-40), widget tests (FR-31, FR-39), localization check |

Minimum platforms: Android 9 (API 28), iOS 15 (NFR-20).
