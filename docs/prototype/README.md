# UX Prototype of Key User Scenarios

| | |
|---|---|
| **Pre-defense item** | 8. UX / prototype |
| **YouTrack task** | [DOA-11](https://yeralytemir.youtrack.cloud/issue/DOA-11) |
| **Version / date** | 0.1, 22 October 2026 |
| **Source code** | [`mobile/`](../../mobile/) (Flutter) |
| **Online demo** | [Web build](https://claude.ai/artifact/R7UrdujHwhD1bVwGGv4BXE) (opens in a browser, about 15 MB on first load) |
| **Related documents** | [Requirements](../requirements/requirements.md) (DOA-8), [technology comparison](../architecture/technology-comparison.md) (DOA-7), [project proposal](../proposal/proposal.md) |

---

## 1. What the prototype is

The prototype is a clickable Flutter application that runs on Android, iOS and in a web browser from one code base, as selected in the technology comparison (D1). It was built instead of a Figma mock-up: every screen is real, navigable code that will be extended into the pilot application, not discarded.

It covers the core user path of the proposal: **onboarding and screening → logging → factor identification → explained recommendations → progress and safety check-in**, in both study arms (intervention and control) and in all three interface languages (Kazakh, Russian, English).

**What it is not.** The prototype has no backend, database, authentication, notifications or wearable connection; these are built in DOA-17 to DOA-21. All data are kept in memory and reset on restart.

### 1.1 Data used in the prototype

| Data | Status |
|---|---|
| User profile and 14 days of logs | **Synthetic demo data** (one made-up profile, [`demo_data.dart`](../../mobile/lib/data/demo_data.dart)). No real person or participant data. The app shows a "Prototype · demo data" strip on every screen. |
| Food list (17 foods, incl. 4 local dishes) | **Illustrative values only**, typed in for the interface demo and not taken from a verified food composition table ([`food_db.dart`](../../mobile/lib/data/food_db.dart)). Values for local dishes are rough placeholders. The real food database with sources is compiled in DOA-16 (FR-07). These numbers must not be used in the thesis. |
| Rule thresholds | From the cited guidelines listed in Section 4, except values marked **team-set (T)**, which are placeholders until the rule base is formalised in DOA-16. |
| AI-assisted food logging (FR-40) | **Simulated.** No AI service is called; words of the meal description are matched against the food list to show the confirm-before-save flow. |

---

## 2. Screens and use cases

Screenshots: Android-size viewport (390 × 844 dp), Russian interface unless stated. Use-case IDs (UC-xx) refer to the [use case diagram and specification](../architecture/use-cases.md) (DOA-10).

| # | Screen | Screenshot | Use case | Requirements shown |
|---|---|---|---|---|
| 1 | Welcome and language choice | [01-language](screens/01-language.png) | UC-05 Choose interface language | FR-39, NFR-19 |
| 2 | Study information and consent | [02-consent](screens/02-consent.png) | UC-02 Give informed consent | FR-02 |
| 3 | Screening questionnaire (age, height, weight, BMI, exclusions, PAR-Q+) | [03-screening](screens/03-screening.png) | UC-03 Complete eligibility screening | FR-04, FR-06 |
| 4 | Eligible: baseline week and study group | [04-eligible](screens/04-eligible.png) | UC-03 Complete eligibility screening; UC-06 Be assigned to a study arm | FR-04, FR-12, FR-30 |
| 5 | Not eligible: referral to clinical care | [05-ineligible](screens/05-ineligible.png) | UC-04 Receive referral to clinical care | FR-05 |
| 6 | Today (dashboard): intake and steps against targets, main factor, first recommendation, prompt example, check-in reminder | [06-today](screens/06-today.png) | Daily overview: UC-13 View progress, UC-17 View ranked lifestyle factors, UC-18 View recommendations, UC-20 Receive activity prompt, UC-14 reminder | FR-14, FR-18, FR-22, FR-25, FR-28 |
| 7 | Food and weight log: search, today's entries, weight and waist | [07-log](screens/07-log.png) | UC-08 Log food; UC-11 Log weight and waist | FR-07, FR-09 |
| 8 | Describe a meal: proposal and confirmation before saving | [08-ai-logging](screens/08-ai-logging.png) | UC-09 Log food with AI assistance | FR-40 (simulated) |
| 9 | Factors: ranked by deviation with value, target and rule ID | [09-factors](screens/09-factors.png) | UC-17 View ranked lifestyle factors | FR-13, FR-14 |
| 10 | Plan: recommendations ordered by factors; hard-constraint checks | [10-plan](screens/10-plan.png) | UC-18 View recommendations | FR-15, FR-16, FR-18, FR-20, FR-21, FR-22, FR-24 |
| 11 | "Why?": reason, rule ID and version, inputs, evidence source | [11-why](screens/11-why.png) | UC-19 View explanation (“Why?”) | FR-23, FR-37 |
| 12 | Progress: weight trend, steps with baseline week and target, energy per day | [12-progress](screens/12-progress.png) | UC-13 View progress | FR-27 |
| 13 | Weekly check-in | [13-checkin](screens/13-checkin.png) | UC-14 Complete weekly safety check-in | FR-28 |
| 14 | Check-in with a reported problem: activity paused, referral | [14-referral](screens/14-referral.png) | UC-14 Complete weekly safety check-in; UC-04 Receive referral to clinical care | FR-29 |
| 15 | Settings: language, study group (demo switch), active hours, rule list | [15-settings](screens/15-settings.png) | UC-05 Choose interface language; UC-21 Set active hours and mute prompts | FR-26, FR-37, FR-39 |
| 16 | Control arm: same app, tracking only, no Factors and Plan tabs | [16-control-today](screens/16-control-today.png) | Control-arm participant: self-monitoring use cases only | FR-31 |
| 17 | Plan in Kazakh | [17-plan-kk](screens/17-plan-kk.png) | UC-05 Choose interface language | FR-39, NFR-19 |
| 18 | Plan in English | [18-plan-en](screens/18-plan-en.png) | UC-05 Choose interface language | FR-39, NFR-19 |

### 2.1 Clickable flow

```
Language → Consent → Screening ─┬─ eligible → Group and baseline week → Today
                                └─ not eligible → Referral (no recommendations)

Today ⇄ Log ⇄ Factors ⇄ Plan ⇄ Progress      (bottom navigation)
Today → Weekly check-in → (problem reported) → Referral, activity paused
Log → Describe a meal → Check proposal → Save
Plan → Why? (explanation sheet)
Settings (app bar) → language, study group, rule list, restart demo
Control arm: Today ⇄ Log ⇄ Progress only
```

---

## 3. How to run

Requirements: [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.47.7 or newer (the prototype was built and tested with this version).

```bash
cd mobile
flutter pub get
flutter run -d chrome        # in a browser
flutter run                  # on a connected Android or iOS device / emulator
flutter test                 # 23 automated tests
```

**Demo links (web).** A query string opens a screen directly, which is useful during the presentation:
`?screen=<name>&lang=<kk|ru|en>[&arm=control]`, where `<name>` is one of `consent`, `screening`, `eligible`, `ineligible`, `today`, `log`, `ai`, `factors`, `plan`, `why`, `progress`, `checkin`, `referral`, `settings`. Without parameters the app starts at the language screen. For example, after `flutter run -d chrome --web-port 8080`: `http://localhost:8080/?screen=why&lang=kk`.

**Suggested demo script (3 minutes).** Language → consent → screening with the pre-filled synthetic answers → "Open the demo (day 14)" → Today → Factors → Plan → "Why?" on the first recommendation → Settings: switch to Қазақша, then switch the study group to "tracking only" and show that Factors and Plan disappear → Log → Describe a meal → confirm.

---

## 4. Prototype rule base

The rules live in [`rule_base.dart`](../../mobile/lib/rules/rule_base.dart). They are a client-side stand-in for the versioned rule base and Python evaluator of the full system (DOA-16, decision D5), written so that the prototype shows real factor ranking, ordering and explanations. Every rule has an ID, a version (0.1), a status and an evidence source; the same list is visible in the app under Settings → Rule base.

| Rule | What it does in the prototype | Source | Status |
|---|---|---|---|
| ELIG-01 | Eligibility: 18–60 years, BMI 25.0–34.9 kg/m², exclusions, PAR-Q+ | Proposal, Section 3; EASO position statement (Hassapidou *et al.*, 2023) | Project decision |
| BMI-01 | BMI = weight / height² | WHO fact sheet "Obesity and overweight" | Guideline |
| EN-01 | Energy target = Mifflin–St Jeor resting energy × PAL − 600 kcal/day, never below resting energy; PAL 1.40 / 1.70 / 2.00 for low / moderate / high activity | Mifflin *et al.*, 1990; FAO/WHO/UNU, 2004 (lower bounds of PAL categories); NICE CG189, 2014 | Guideline; **±10% tolerance is T** |
| MAC-01 | Energy shares: protein 10–35%, fat 20–35%, carbohydrate 45–65% | Institute of Medicine, 2005 (AMDR) | Guideline |
| CA-01 | Calcium ≥ RDA by age and sex (1000 mg/day for 19–50 years) | Institute of Medicine, 2011 | Guideline |
| FV-01 | Fruit and vegetables ≥ 400 g/day | WHO/FAO, TRS 916, 2003 | Guideline |
| STEP-01 | Baseline = mean steps of days 1–7; no target in the baseline week; target rises from the baseline each week | Ikegaya *et al.*, 2025 (baseline-derived thresholds) | **+10% of baseline per week is T** |
| PA-01 | Two muscle-strengthening sessions per week | WHO 2020 guidelines (Bull *et al.*, 2020) | Guideline |
| SED-01 | Sitting-break recommendation when there are more than 2 sitting periods of ≥ 60 min per day | WHO 2020 guidelines (limit sedentary time) | **60 min and 2 periods are T** |
| FAC-01 | Factor score = relative deviation from the target range (0 to 1); factors ranked by score | Team method | **T** |

The full bibliographic references are added to the thesis reference list when the rule base is formalised in DOA-16; the sources must be re-checked against the original documents at that point.

---

## 5. Verification of the prototype

| Check | Result (22 October 2026) |
|---|---|
| `flutter analyze` | No issues |
| `flutter test` | 23 tests passed |
| Eligibility boundary table of FR-04 (17/18/60/61 years; BMI 24.9/25.0/34.9/35.0; each exclusion) | Passed (unit tests) |
| No step target in the baseline week (FR-12); target never below baseline over 12 weeks (FR-18) | Passed (unit tests) |
| First recommendation addresses the top-ranked factor (FR-22); every recommendation has rule ID, version, source and inputs (FR-23) | Passed for the demo profile (unit tests) |
| Adverse event suspends activity recommendations (FR-29) | Passed (unit test) |
| Control arm shows no Factors and Plan tabs (FR-31) | Passed (widget test) |
| Same text keys in KK, RU and EN, no empty values (NFR-19) | Passed (automated check) |
| Language switch keeps logged data (FR-39) | Passed (widget test) |
| Simulated AI proposal returns only foods from the food list (FR-40) | Passed (unit test) |

These tests check the prototype, not the final system. The 200-profile verification of SQ1 (FR-38, NFR-24) runs on the backend rule engine in DOA-23.

---

## 6. Known limitations and next steps

1. **Texts.** Kazakh and Russian texts were written by the team and need review by native speakers before the pilot (requirements, open question 1).
2. **Food data.** Illustrative values are replaced by a sourced food composition table with local dishes (DOA-16, FR-07).
3. **Rule base.** Team-set placeholders (T) are reviewed and the rules are moved to the backend evaluator (DOA-16, DOA-18).
4. **Not yet implemented:** backend and sync (DOA-17), notifications (FR-25), Health Connect and HealthKit (DOA-21), engagement logging and export (FR-32, FR-35), real AI service (FR-40, subject to DOA-24).
5. **Interview findings.** The screens will be revised after the DOA-4 interviews (assumptions A2, A4, A6, A8).
