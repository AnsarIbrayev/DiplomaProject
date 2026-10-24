# Evidence of Relevance

> Written by Kadirbay B. (commit `c1e3a4e`, 23 October 2026), moved here from the repository root. Pre-defense item 2, [DOA-4](https://yeralytemir.youtrack.cloud/issue/DOA-4). No separate records of interviews I1–I3 were kept; this summary is the only record.

> **Editor's notes (Ibrayev A., 24 October 2026).** (1) Row A1 records the agreed diploma topic; no meeting with the supervisor has taken place yet, and her feedback is pending ([feedback log](../../meetings/2026-10-supervisor-review/feedback-log.md)). (2) The machine-learning module (A1) and the hybrid recommendation algorithm (Section 3) describe an early idea; the project uses a versioned rule base instead (decision D5 in the [technology comparison](../../architecture/technology-comparison.md)). (3) The dataset in Section 2 has not been identified, so the dataset analysis is not used as evidence. (4) Findings marked "Verified" rest on two or three interviews without records; they are treated as preliminary, and the statuses in the [assumptions register](../02-assumptions-register.md) were not changed on their basis.

## 1 Primary evidence and stakeholder engagement

To ground the system requirements in real needs, evidence was gathered through structured interviews with user representatives and a domain expert, together with a substantive agreement with the project supervisor/client on the project scope.

| ID | Participant | Context | Key insight |
|---|---|---|---|
| I1 | Target user (weight-loss goal) | Individual attempting weight loss with existing tracking apps | Frustrated with passive calorie-counting apps such as MyFitnessPal. Logging food without understanding why weight fluctuates (sleep loss, stress, sedentary work blocks) leads to burnout. |
| I2 | Target user (weight maintenance and habit building) | Individual seeking sustainable lifestyle changes | Wants proactive, context-aware micro-recommendations (for example, "High stress detected today: try a 15-minute walk instead of restrictive dieting") rather than static diet plans. |
| I3 | Domain expert (clinical nutritionist / dietitian) | Professional specializing in metabolic health and obesity management | Obesity is multi-factorial (diet, physical activity, sleep quality, stress, alcohol, transport habits). One-size-fits-all recommendations fail because they do not isolate individual risk factors. |
| A1 | Project supervisor / client | Formal agreement on scope | Core project boundary: a mobile application with a machine-learning-backed factor analysis module and a personalized recommendation engine. |

## 2 Observation of existing processes and data analysis

**Process observation.** Analysis of current mobile health (mHealth) workflows revealed a critical gap: standard apps function mainly as passive logs rather than active decision-support systems. Users log data, but the app does not analyze the underlying obesity drivers or give personalized advice.

**Dataset analysis.** Analysis of a benchmark dataset (a public dataset on obesity levels based on eating habits and physical condition) showed strong non-linear relationships between obesity severity and non-dietary variables such as transportation mode, number of main meals, and daily water intake.

## 3 Verified findings versus assumptions

A critical step in defining the specification is separating empirically supported findings from initial project assumptions.

| Category | Item | Status / source |
|---|---|---|
| Verified finding | Users abandon passive logging apps within 2-3 weeks if no actionable recommendations are provided. | Verified (interviews I1, I2) |
| Verified finding | Obesity factors differ significantly per individual; sleep and stress are frequently ignored triggers. | Verified (expert interview I3 and data analysis) |
| Verified finding | Recommendations must be adaptive and low-friction to maintain user engagement. | Verified (interviews I1, I2) |
| Assumption | Users will reliably log qualitative metrics (daily stress, mood) without push prompts. | Assumption; to be validated during UX testing |
| Assumption | A collaborative/content-based hybrid recommendation algorithm will achieve acceptable accuracy on sparse user logs. | Assumption; to be validated during ML model validation |

## 4 How the evidence informs system requirements

| Module | Requirement | Informed by |
|---|---|---|
| Obesity factor identification | Evaluate multi-dimensional user inputs (diet, activity, sleep, stress) to highlight the user's top personalized risk factors. | Multi-factorial obesity drivers (I3, dataset analysis) |
| Personalized recommendation engine | Generate prioritized, context-sensitive micro-recommendations that target the identified risk factors. | Failure of static, generic diet plans (I2, I3) |
| Interactive tracking and feedback loop | Provide push notifications, habit completion tracking, and visual feedback to reduce user drop-off. | Low retention in passive logging apps (I1, I2) |

---
