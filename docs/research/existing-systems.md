# Existing System Comparison

| | |
|---|---|
| **Pre-defense item** | 4. Existing system comparison |
| **YouTrack task** | [DOA-6](https://yeralytemir.youtrack.cloud/issue/DOA-6) |
| **Version / date** | 1.0, 22 October 2026 |
| **Evidence checked on** | 22 October 2026 (all online sources) |
| **Related documents** | [Project proposal](../proposal/proposal.md), [assumptions register](02-assumptions-register.md), [requirements](../requirements/requirements.md) |

---

## 1. Purpose and Method

### 1.1 Purpose

This document compares five mobile applications that people in Kazakhstan can currently use to manage their weight. It applies one set of ten criteria to all of them, records the evidence for every assessment, and identifies the gap that motivates the proposed system: a transparent, rule-based recommender that identifies each user's modifiable lifestyle factors and jointly personalizes nutrition and physical activity recommendations (see the [proposal](../proposal/proposal.md), Sections 2 and 4).

### 1.2 Selection of systems

An application was included if it met all of the following conditions:

1. It supports weight management through food logging and a personal energy target.
2. It is listed in the Kazakhstan storefront of the Apple App Store on the date of the check.
3. It is either a widely used international application with published peer-reviewed evaluations or database studies, or an application developed in Kazakhstan.

| System | Developer | Reason for inclusion |
|---|---|---|
| MyFitnessPal | MyFitnessPal, Inc. | Widely used food-logging application; evaluated in a randomized controlled trial (RCT) and in database accuracy studies [12]–[15] |
| Noom | Noom, Inc. | Behavior-change program with human coaching; evaluated in an RCT [16] |
| YAZIO | YAZIO GmbH | Calorie counter with a Russian interface, fasting plans and meal plans |
| FatSecret | Secret Industries Pty Ltd | Calorie counter with a Russian interface and a channel for health professionals |
| TayQazan Tracker | Institute of Smart Systems and Artificial Intelligence (ISSAI), Nazarbayev University | Application developed in Kazakhstan that targets local dishes and offers a Kazakh interface |

Two further candidates were screened and excluded:

- **Lose It!** is listed in the Kazakhstan storefront, but its interface languages are English, French, German, Japanese, Korean, Portuguese, Simplified Chinese and Spanish [10], so it is not usable in Russian or Kazakh, and its feature set overlaps with MyFitnessPal. Published evaluations of Lose It! exist [15], [17].
- **NutriSteppe**, a healthy-eating application presented in 2022 by the National Center for Healthy Nutrition of Kazakhstan, offered a database of more than 20,000 standardized products, daily energy and macronutrient calculation and a traffic-light warning for calories, salt, sugar and fat [11]. Its App Store listing could not be opened on 22 October 2026, so its current availability and features could not be verified. It is therefore excluded from the comparison and mentioned only as a local reference point.

### 1.3 Comparison criteria

The criteria follow from the problem statement of the proposal and from the assumptions register. Each criterion names what it is linked to.

| ID | Criterion | What is assessed | Linked to |
|---|---|---|---|
| C1 | Availability and cost in Kazakhstan | Listing in the Kazakhstan App Store; price of the download and range of in-app purchase prices in tenge (₸) | Target users (proposal, Section 3) |
| C2 | Interface language | Russian and Kazakh in the official language list | Local context; A5 |
| C3 | Food logging and database | Database size as stated by the vendor; logging methods; independent accuracy data | O2; A2 |
| C4 | Local food coverage | Presence of Kazakh dishes (for example, beshbarmak, baursak, kuyrdak, manty, kazy) | A5, E3 |
| C5 | Activity data and devices | Step or exercise logging; integration with Apple Health, Google Health Connect or wearables | O2; A9 |
| C6 | Type of personalized guidance | What is personalized (energy target, meal plan, course) and by whom (rules, human coach, AI assistant) | Problem 1 (proposal, Section 2.2) |
| C7 | Joint nutrition and activity recommendations; factor identification | Whether the application recommends activity targets as well as nutrition, and whether it shows which of the user's lifestyle factors deviate most | O1; Problem 2; A3, A6 |
| C8 | Explainability, guideline constraints and safety | Whether each recommendation shows its reason and source; whether recommendations are constrained by guidelines; eligibility screening or disclaimers | O1, SQ1; Problem 3; A4, A12 |
| C9 | Independent peer-reviewed evaluation | Published RCTs or validation studies of the application | Problem 1; H1–H3 |
| C10 | Data privacy | Data categories declared in the App Store privacy label, especially data "used to track you" | A10; data protection (proposal, Section 8) |

### 1.4 Evidence sources and rules

- **Official listings.** For each application, the Kazakhstan storefront of the App Store was used for availability, prices and languages [1], [3], [5], [7], [9]. Descriptions and privacy labels were taken from the same application's listing in the U.S. or global storefront where the Kazakhstan page did not show them [2], [4], [6], [8]. Privacy labels are reported by developers and are not verified by Apple.
- **Vendor claims.** Database sizes and feature descriptions are the vendors' own statements and are reported as such, not as verified facts.
- **Peer-reviewed studies.** Studies were found through web searches and Crossref metadata on 22 October 2026. This was not a systematic search, so "none identified" means that no study was found, not that none exists.
- **Absence of a feature.** "Not described" means that the feature does not appear in the official sources listed above. It does not prove that the feature is absent. Paid features were not tested. Criteria C4 and C8 need a hands-on check of the applications (Section 6).

---

## 2. Overview of the Systems

**MyFitnessPal.** A food and exercise diary with calorie and macronutrient goals. The vendor states a database of more than 20.5 million foods, barcode, meal-scan and voice logging, a meal planner, connection to more than 40 fitness trackers and health applications, and an "AI Coach" that gives "nutrition insights tailored to your goals, habits, and logging history" [2]. Premium Plus adds personalized meal plans and grocery delivery [2].

**Noom.** A psychology-based weight-loss course of ten mini-courses influenced by cognitive behavioral, dialectical behavioral and acceptance and commitment therapies, with more than 1,000 lessons, 1:1 coaching with personalized goal setting, group support and food logging with a database of more than one million items; it connects to the Apple Health app [4].

**YAZIO.** A calorie counter that the vendor describes as having more than 4 million searchable items, barcode scanning, an optional intermittent fasting tracker (for example, 16:8 and 5:2), more than 2,900 recipes, custom meal plans in the PRO version, step and activity tracking, and synchronization with Fitbit, Garmin and other devices in PRO [6]. It is marketed as an "AI calorie tracker", but the listing does not explain what the AI does [6].

**FatSecret.** A food diary with a nutrition database that the vendor describes as customized for U.S. foods and brands, barcode scanning, photo-based logging, an exercise diary, a weight tracker, and integration with the Apple Health app and Fitbit. Premium adds dietitian-created meal plans. The application synchronizes with fatsecret Professional, which gives health professionals access to monitor and advise users [8].

**TayQazan Tracker.** A free application by ISSAI. The listing shows versions 1.0 to 1.0.2 dated 8 to 20 September without the year; its copyright line reads 2026. It estimates calories and macronutrients from meal photos, names Kazakh dishes such as beshbarmak and plov, offers a diary with water and weight logging, sets personal targets "from your body, activity and goal", and provides an AI chat assistant that answers questions from the user's diary. The description states that the application is localized in Kazakh, Russian and English and that its values are "AI estimates for everyday awareness, not medical advice" [9]. ISSAI has earlier published a Central Asian food image dataset for dietary interventions [18]; the listing does not state whether the application uses it.

---

## 3. Comparison Table

Legend: **●** described in official sources or shown in a study; **◐** partly; **○** not described in the sources checked (Section 1.4); **?** requires a hands-on check (Section 6). The last column shows the planned design of the proposed system, not a finished product.

| Criterion | MyFitnessPal | Noom | YAZIO | FatSecret | TayQazan Tracker | Proposed system (planned) |
|---|---|---|---|---|---|---|
| **C1** Availability and cost in Kazakhstan | ● Free download; Premium purchases 3,390–30,990 ₸ [1] | ● Free download; "Noom Program" purchases 15,490–179,990 ₸ [3] | ● Free download; PRO purchases 3,690–29,990 ₸ [5] | ● Free download; subscriptions 3,350–20,490 ₸ [7] | ● Free; no in-app purchases shown [9] | Free research prototype; no app-store release (proposal, 7.2) |
| **C2** Interface language | ◐ Russian: yes; Kazakh: no (20 languages) [1] | ○ English, German, Korean, Spanish only [3] | ◐ Russian: yes; Kazakh: no (20 languages) [5] | ◐ Russian: yes; Kazakh: no (23 languages) [7] | ● Kazakh, Russian, English (per description) [9] | Russian and English planned; Kazakh to be decided in requirements |
| **C3** Food logging and database | ● >20.5M foods (vendor); barcode, meal scan, voice [2]. Energy and macronutrients agree with reference databases; calcium, iron, vitamin C, sodium and cholesterol less accurate [14], [15] | ● >1M items (vendor); barcode [4]. Smallest energy difference of five apps (14.7 kcal) in [15] | ● >4M items (vendor); barcode [6] | ● Database "customized for US foods and brands"; barcode, photo logging [8]. Protein and sodium lower than reference in [15] | ◐ Photo-based AI estimates of calories and macronutrients [9]; accuracy not reported | Food database with locally consumed foods (proposal, 7.1) |
| **C4** Local food coverage | ? | ? | ? | ? | ◐ Names beshbarmak and plov [9]; coverage not quantified | Kazakh dishes in the food database (A5, E3) |
| **C5** Activity data and devices | ● Workouts and steps; >40 trackers and health apps [2] | ◐ Apple Health connection [4]; step tracking not described | ● Steps and activity; Fitbit, Garmin and others in PRO [6] | ● Exercise diary; Apple Health and Fitbit [8] | ○ Not described; activity level used only as an input to targets [9] | Steps from phone; optional Health Connect and HealthKit (heart rate) |
| **C6** Type of personalized guidance | Calorie and macro goals; meal planner; personalized meal plans (Premium Plus); generative AI Coach [2] | Behavior-change course; human 1:1 coach with personalized goals [4] | Calorie goal; fasting plans; custom meal plans (PRO); unspecified AI [6] | Calorie and macro goals; dietitian-created meal plans (Premium); optional professional supervision [8] | Personal calorie and macro targets; AI chat assistant [9] | Deterministic rules from EASO guidance and trials (proposal, [2], [7]); weekly target updates |
| **C7** Joint nutrition and activity recommendations; factor identification | ○ Exercise is logged to estimate calories burned; activity recommendations and factor ranking not described [2] | ○ Not described [4] | ○ Not described [6] | ○ Not described [8] | ○ Not described [9] | ● Joint energy, macronutrient, step, intensity and sitting-break recommendations; ranking of deviating factors (O1) |
| **C8** Explainability, guideline constraints, safety | ○ How AI Coach output is generated or constrained is not described [2]; ? | ○ Not described [4]; ? | ○ Not described [6]; ? | ◐ Meal plans written by dietitians [8]; per-recommendation explanation not described; ? | ◐ Disclaimer: "not medical advice" [9]; explanation not described; ? | ● Every recommendation shows its rule and source; hard constraints verified on 200 synthetic profiles (SQ1); PAR-Q+ screening |
| **C9** Independent peer-reviewed evaluation | ◐ RCT (n = 212, 6 months): no difference in weight vs usual care, −0.30 kg (95% CI −1.50 to 0.95) [12]; used as the platform in a 3-arm RCT of self-monitoring strategies [13]; database studies [14], [15] | ● RCT in prediabetes (n = 202): weight −2.64 kg vs usual care at 6 months (ITT) [16]; database study [15] | ○ None identified | ◐ Database accuracy study only [15] | ○ None identified (recently released) | Planned 12-week two-arm pilot against a self-monitoring control (O3, O4) |
| **C10** Data privacy (developer-reported label) | Identifiers and usage data used to track; health data linked to user [2] | User content used to track; health data linked to user [4] | Identifiers used to track; health data linked to user [6] | No data used to track; health data linked to user [8] | "Does not collect any data" [9] | Pseudonymization, data minimization, no third-party tracking (proposal, Section 8) |

Application versions on the date of the check: MyFitnessPal 26.42.0 [2], Noom 11.1.0 [4], YAZIO 26.42.0 [6], FatSecret 11.9 [8], TayQazan Tracker 1.0.2 [9]. The database studies [14], [15] tested earlier versions; their results may not hold for the current databases.

---

## 4. Findings

1. **Personalization is mostly about energy targets and meal plans.** All five applications set a personal energy target (C6). Beyond that, personalization is delivered by a human (Noom coaches, FatSecret dietitians and professionals) or by AI features whose method is not described (MyFitnessPal AI Coach, YAZIO, TayQazan assistant). None of the official descriptions mentions recommendations that are generated by documented, guideline-based rules (C8).
2. **Activity is logged, not recommended.** Four applications record exercise or steps, and three connect to wearables (C5), but none describes personalized activity targets or a ranking of which of the user's lifestyle factors deviate most (C7). Activity mainly feeds the calorie balance.
3. **No application explains its recommendations.** No official source describes showing the reason and evidence source for each recommendation (C8). This matters because an evaluation of menus produced by a general-purpose AI chatbot for a simulated person with obesity found less energy than requested, unbalanced macronutrients and insufficient calcium [21].
4. **Evidence of effect is thin and mixed.** Only two of the five applications have an RCT on weight (C9). MyFitnessPal showed no weight difference against usual care [12], while the coach-guided Noom diabetes prevention program reduced weight against usual care in adults with prediabetes [16]. Neither trial compared the application with a self-monitoring-only version, and neither was conducted in Central Asia. This matches the literature: stand-alone digital interventions show small effects that disappear against active controls [19], and tailored feedback did not improve weight loss over self-monitoring alone in the SMARTER trial [20].
5. **The local context is only partly covered.** Russian is available in three applications and Kazakh only in TayQazan Tracker (C2). The international applications describe databases built around large or U.S. markets; whether they contain Kazakh dishes still needs a hands-on check (C4). The local application, TayQazan Tracker, covers language and local dishes but does not describe activity data, activity recommendations or explanations (C5, C7, C8).
6. **Privacy practices differ.** Three applications declare data used to track users across other companies' applications and websites (C10). Health and fitness data are linked to the user's identity in all four international applications.

---

## 5. Gap Analysis and Positioning

### 5.1 Gaps not covered by any compared system

| Gap | Evidence in this comparison | Literature | Response of the proposed system | Assumption to test / requirement to write (DOA-8) |
|---|---|---|---|---|
| **G1.** No explanation of recommendations, no stated guideline constraints | C8: ○ or ◐ for all five | [21] | Every recommendation shows the rule and evidence source that produced it; hard constraints checked on 200 synthetic profiles (O1, O2, SQ1) | A4; FR: explanation for every recommendation; NFR: rule traceability |
| **G2.** No joint nutrition and activity recommendations, no identification of the user's deviating lifestyle factors | C7: ○ for all five | Nutrition-only and activity-only personalization showed small or short-lived effects [22], [23] | Rule engine ranks the user's deviating factors and gives joint nutrition, step, intensity and sitting-break targets (O1) | A3, A6, A7; FR: factor ranking, joint recommendations |
| **G3.** No application combines local language, local foods and activity data | C2, C4, C5 | Desk research: no reviewed trial from Central Asia (proposal, Section 2.2) | Russian interface (Kazakh to be decided), local food database, Health Connect and HealthKit integration | A5, A9, E3; FR: local food database; FR: wearable integration |
| **G4.** No evidence against a self-monitoring control | C9 | [19], [20] | Two-arm pilot against a self-monitoring-only version of the same application (O3, O4, H1–H3) | Evaluation plan (pre-defense item 9) |

### 5.2 What the proposed system does not try to compete on

The proposed system is a research prototype. It does not aim to match the commercial applications on database size, photo or voice logging, human coaching, recipes or social features, and it is not released in app stores (proposal, Section 7.2). Its contribution is the transparent, rule-based personalization of nutrition and activity (G1, G2), adapted to local users (G3), and its evaluation against self-monitoring (G4). Where a commercial feature is useful (for example, barcode scanning or wearable synchronization), the technology comparison (pre-defense item 5, DOA-7) decides whether an existing service or library can be reused.

### 5.3 Use in the thesis

This comparison feeds Section 1.2 "Review of existing solutions" of the thesis ([02-domain-analysis.md](../thesis/02-domain-analysis.md)) and the requirements specification (DOA-8).

---

## 6. Hands-on Check (to complete before the pre-defense)

Criteria C4 and C8 cannot be assessed from official descriptions. The DOA-6 acceptance criteria require a source or a dated screenshot for every claim, so the following check should be done on a phone in Kazakhstan with the free version of each application. Screenshots go to `docs/research/screenshots/` named `<app>-<check>-<YYYY-MM-DD>.png`. No personal data may appear in the screenshots.

| Check | Procedure | Result to record |
|---|---|---|
| H1. Local foods (C4) | Search for five dishes in Russian: «бешбармак» (beshbarmak), «баурсак» (baursak), «куырдак» (kuyrdak), «манты» (manty), «казы» (kazy) | For each app: number of the five dishes found, one screenshot per app |
| H2. Safety screening (C8) | Go through onboarding as a new user | Whether the app asks about pregnancy, diabetes, eating disorders, medication or exercise contraindications, and whether it refers anyone to a doctor |
| H3. Explanation (C8) | Open the calorie target and any recommendation or suggestion screen | Whether the app shows why the target or recommendation was given and on what source |

Until the check is done, the cells marked **?** in Section 3 stay open and must not be reported as "absent".

---

## 7. Limitations

- The comparison relies on official store listings and vendor descriptions, which can change at any time and describe features as the vendor chooses. The date of the check is therefore given for every source.
- Paid features were not tested, and features that the descriptions do not mention may exist.
- The search for peer-reviewed evaluations was not systematic.
- Database accuracy studies [14], [15] used earlier versions of the applications and small samples (for example, 20 weighed food records in [15]).
- Privacy labels are self-reported by the developers and do not describe how data are protected.
- Prices are App Store prices in tenge on the date of the check; the listings do not state the duration of each plan, so only ranges are given.

---

## References

[1] MyFitnessPal, Inc., "MyFitnessPal: Calorie Counter," App Store (Kazakhstan). [Online]. Available: https://apps.apple.com/kz/app/id341232718 (accessed Oct. 22, 2026).

[2] MyFitnessPal, Inc., "MyFitnessPal: Calorie Counter," version 26.42.0, App Store (United States). [Online]. Available: https://apps.apple.com/us/app/myfitnesspal-calorie-counter/id341232718 (accessed Oct. 22, 2026).

[3] Noom, Inc., "Noom Weight Loss, Food Tracker," App Store (Kazakhstan). [Online]. Available: https://apps.apple.com/kz/app/noom/id634598719 (accessed Oct. 22, 2026).

[4] Noom, Inc., "Noom Weight Loss, Food Tracker," version 11.1.0, App Store. [Online]. Available: https://apps.apple.com/app/noom/id634598719 (accessed Oct. 22, 2026).

[5] YAZIO GmbH, "AI Calorie Counter by Yazio," App Store (Kazakhstan). [Online]. Available: https://apps.apple.com/kz/app/id946099227 (accessed Oct. 22, 2026).

[6] YAZIO GmbH, "AI Calorie Tracker by Yazio," version 26.42.0, App Store. [Online]. Available: https://apps.apple.com/app/apple-store/id946099227 (accessed Oct. 22, 2026).

[7] Secret Industries Pty Ltd, "Calorie Counter by fatsecret," App Store (Kazakhstan). [Online]. Available: https://apps.apple.com/kz/app/id347184248 (accessed Oct. 22, 2026).

[8] Secret Industries Pty Ltd, "Calorie Counter by fatsecret," version 11.9, App Store (United States). [Online]. Available: https://apps.apple.com/us/app/-/id347184248 (accessed Oct. 22, 2026).

[9] Institute of Smart Systems and Artificial Intelligence, "TayQazan Tracker," version 1.0.2, App Store (Kazakhstan). [Online]. Available: https://apps.apple.com/kz/app/id6755522942 (accessed Oct. 22, 2026).

[10] FitNow, Inc., "Lose It! – Calorie Counter," App Store (Kazakhstan). [Online]. Available: https://apps.apple.com/kz/app/id297368629 (accessed Oct. 22, 2026).

[11] Tengrinews.kz, "Приложение для правильного питания разработали в Казахстане," May 6, 2022. [Online]. Available: https://tengrinews.kz/kazakhstan_news/prilojenie-dlya-pravilnogo-pitaniya-razrabotali-v-kazahstane-468057/ (accessed Oct. 22, 2026).

[12] B. Y. Laing *et al.*, "Effectiveness of a smartphone application for weight loss compared with usual care in overweight primary care patients: A randomized, controlled trial," *Annals of Internal Medicine*, vol. 161, no. 10, Suppl., pp. S5–S12, 2014, doi: 10.7326/M13-3005.

[13] M. L. Patel, C. M. Hopkins, T. L. Brooks, and G. G. Bennett, "Comparing self-monitoring strategies for weight loss in a smartphone app: Randomized controlled trial," *JMIR mHealth and uHealth*, vol. 7, no. 2, Art. no. e12209, 2019, doi: 10.2196/12209.

[14] C. Evenepoel, E. Clevers, L. Deroover, W. Van Loo, C. Matthys, and K. Verbeke, "Accuracy of nutrient calculations using the consumer-focused online app MyFitnessPal: Validation study," *Journal of Medical Internet Research*, vol. 22, no. 10, Art. no. e18237, 2020, doi: 10.2196/18237.

[15] R. Fallaize, R. Zenun Franco, J. Pasang, F. Hwang, and J. A. Lovegrove, "Popular nutrition-related mobile apps: An agreement assessment against a UK reference method," *JMIR mHealth and uHealth*, vol. 7, no. 2, Art. no. e9838, 2019, doi: 10.2196/mhealth.9838.

[16] T. Toro-Ramos *et al.*, "Mobile delivery of the diabetes prevention program in people with prediabetes: Randomized controlled trial," *JMIR mHealth and uHealth*, vol. 8, no. 7, Art. no. e17842, 2020, doi: 10.2196/17842.

[17] C. M. Wharton, C. S. Johnston, B. K. Cunningham, and D. Sterner, "Dietary self-monitoring, but not dietary quality, improves with use of smartphone app technology in an 8-week weight loss trial," *Journal of Nutrition Education and Behavior*, vol. 46, no. 5, pp. 440–444, 2014, doi: 10.1016/j.jneb.2014.04.291.

[18] A. Karabay, A. Bolatov, H. Varol, and M.-Y. Chan, "A Central Asian food dataset for personalized dietary interventions," *Nutrients*, vol. 15, no. 7, Art. no. 1728, 2023, doi: 10.3390/nu15071728.

[19] S.-A. Lee and J.-H. Park, "Effects of stand-alone digital lifestyle interventions on weight-related outcomes in adults with overweight or obesity: Systematic review and meta-analysis of randomized controlled trials," *Journal of Medical Internet Research*, vol. 28, Art. no. e81070, 2026, doi: 10.2196/81070.

[20] L. E. Burke *et al.*, "The effect of tailored, daily, smartphone feedback to lifestyle self-monitoring on weight loss at 12 months: The SMARTER randomized clinical trial," *Journal of Medical Internet Research*, vol. 24, no. 7, Art. no. e38243, 2022, doi: 10.2196/38243.

[21] H. M. Bayram, Z. M. Çelik, and H. K. Barcın Güzeldere, "Can artificial intelligence (AI) chatbot tools be used effectively for nutritional management in obesity?," *Nutrition and Health*, vol. 31, pp. 1825–1834, 2025, doi: 10.1177/02601060251329070.

[22] R. Zenun Franco, R. Fallaize, M. Weech, F. Hwang, and J. A. Lovegrove, "Effectiveness of web-based personalized nutrition advice for adults using the eNutri web app: Evidence from the EatWellUK randomized controlled trial," *Journal of Medical Internet Research*, vol. 24, Art. no. e29088, 2022, doi: 10.2196/29088.

[23] M. Ikegaya, J. C. Foo, T. Murata, K. Oshima, and J. Kim, "Using personalized intervention criteria in a mobile just-in-time adaptive intervention for increasing physical activity in university students: Pilot study," *JMIR Human Factors*, vol. 12, Art. no. e66750, 2025, doi: 10.2196/66750.
