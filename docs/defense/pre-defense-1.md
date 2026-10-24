# Pre-Defense 1 Submission Package

| | |
|---|---|
| **Project** | Development of a Mobile Recommender System for Identifying Obesity Factors and Personalized Weight Management |
| **Team** | Ibrayev Ansar, Temirbulatov Yeraly, Kadirbay Bibarys |
| **Supervisor** | Kashkimbayeva Nurzhamal Meirkulovna |
| **Date** | 24 October 2026 |
| **Repository** | https://github.com/AnsarIbrayev/DiplomaProject |
| **Submitted version** | Git tag `prob-period-1` (https://github.com/AnsarIbrayev/DiplomaProject/tree/prob-period-1); tag `pre-defense-1` marks the first merge of the same work into `main` |
| **Online prototype** | https://claude.ai/artifact/R7UrdujHwhD1bVwGGv4BXE (web build of [mobile/](../../mobile/), synthetic demo data) |
| **YouTrack** | https://yeralytemir.youtrack.cloud/projects/DOA |
| **YouTrack task** | [DOA-15](https://yeralytemir.youtrack.cloud/issue/DOA-15) |

---

## 1. Summary of Completed Work

| No. | Component | Deliverable | YouTrack | Pull requests |
|---|---|---|---|---|
| 1 | Project proposal | [docs/proposal/proposal.md](../proposal/proposal.md): title, team, supervisor, problem statement, target users, aim, objectives O1–O4, hypotheses, expected outcomes, scope, engineering complexity | DOA-3 | #5 |
| 2 | Evidence of relevance | [docs/research/relevance-summary.md](../research/relevance-summary.md): verified secondary evidence (statistics, studies of app users, gaps of existing apps), three interviews (two users, one dietitian; [summary](../research/interviews/interview-summary-kadirbay.md)), assumptions register, survey and interview kit | DOA-4 | #6, #8, #20, #27, #28, #32 |
| 3 | Literature review | [docs/research/literature-review.md](../research/literature-review.md): critical review and analysis table, 27 sources; registry in [research/literature/](../../research/literature/README.md) | DOA-5 | #9 |
| 4 | Existing system comparison | [docs/research/existing-systems.md](../research/existing-systems.md): systems compared on a fixed set of criteria, with dated evidence | DOA-6 | #10 |
| 5 | Technology comparison | [docs/architecture/technology-comparison.md](../architecture/technology-comparison.md): seven decisions (D1–D7) with alternatives and justification from the requirements | DOA-7 | #12, #15 |
| 6 | Requirements specification | [docs/requirements/requirements.md](../requirements/requirements.md): 40 FR and 28 NFR with MoSCoW priority, source and acceptance criterion | DOA-8 | #11, #13, #14, #16, #19 |
| 7 | Architecture and diagrams | [architecture.md](../architecture/architecture.md), [use-cases.md](../architecture/use-cases.md) (UC-01 … UC-28), [diagrams/](../architecture/diagrams/README.md): system context, use case, component (draft); PlantUML sources and PNG/SVG exports | DOA-9, DOA-10 | #24 |
| 8 | UX / prototype | [docs/prototype/README.md](../prototype/README.md): clickable Flutter app in [mobile/](../../mobile/), 18 screenshots, screen → use case → FR table, Kazakh / Russian / English | DOA-11 | #18 |
| 9 | Verification and evaluation plan | [docs/evaluation/evaluation-plan.md](../evaluation/evaluation-plan.md): software tests, rule-base verification on 200 synthetic profiles (SQ1), usability test with SUS, 12-week randomized pilot against a self-monitoring baseline | DOA-12 | #17, #19 |
| 10 | Project management and risks | [docs/project-management.md](../project-management.md): roles and RACI, Git / YouTrack workflow, milestones, dependencies and critical path, risk register (17 risks) | DOA-13 | #21, #25 |
| 11 | Supervisor feedback | [docs/meetings/2026-10-supervisor-review/](../meetings/2026-10-supervisor-review/README.md): review package, feedback form, [feedback log](../meetings/2026-10-supervisor-review/feedback-log.md) | DOA-14 | #22, #23 |
| – | README and repository setup | [README.md](../../README.md), [CONTRIBUTING.md](../../CONTRIBUTING.md), [.env.example](../../.env.example), [tests/](../../tests/README.md) | DOA-1, DOA-2 | #1–#3, #7, #26 |

## 2. Known Limitations

1. **Evidence of relevance (item 2) rests mainly on secondary evidence.** Three interviews (two users, one dietitian) were held; their summary is in the repository, but no separate records (date, mode, notes) were kept, so their findings are treated as preliminary and are not coded into the [assumptions register](../research/02-assumptions-register.md). No survey responses have been collected. The survey and further recorded interviews are planned before pre-defense 2.
2. **Supervisor feedback (item 11).** No meeting with the supervisor has taken place yet, and no feedback has been received. The review package is prepared, and the supervisor is being given access to the repository. The feedback log is filled only with the supervisor's own comments, copied verbatim, as they are received.
3. **Prototype.** The prototype has no backend, database, notifications or wearable connection. It uses one synthetic demo profile; food nutrient values are illustrative and are not taken from a verified food composition table. AI-assisted food logging is simulated. The prototype rule base contains placeholder values marked (T).
4. **Team-set values.** Values marked (T) in the requirements and the evaluation plan are design choices of the team, not findings from data, and are subject to supervisor approval.
5. **Not yet implemented.** Backend, production rule engine and verification code (`backend/`, `ml/`). Thesis chapters in `docs/thesis/` are outlines.
6. **Review process.** Pull requests #5–#32 were merged into `develop` without a recorded GitHub review by another team member; content was agreed within the team outside GitHub.

## 3. Outstanding Tasks

| Task | Owner (YouTrack) | Deadline |
|---|---|---|
| DOA-14 Supervisor feedback: record comments and decisions | Ibrayev A. | after the supervisor's reply |
| DOA-4 Planned validation: survey (≥ 15 eligible responses) and/or ≥ 3 interviews | Ibrayev A. | before pre-defense 2 |
| DOA-16 Formalize the recommendation rule base (O1) | Ibrayev A. | 30 Nov 2026 |
| DOA-17 Backend: database schema, authentication, REST API | Kadirbay B. | 30 Nov 2026 |
| DOA-18 Rule engine service with rule trace | Kadirbay B. | 30 Nov 2026 |
| DOA-19 Mobile: onboarding and food / weight / step logging | Temirbulatov Ye. | 30 Nov 2026 |
| DOA-20 Mobile: recommendations screen with rule explanation and prompts | Temirbulatov Ye. | 30 Nov 2026 |
| DOA-21 Wearable integration: Health Connect and HealthKit | Temirbulatov Ye. | 30 Nov 2026 |
| DOA-22 Control-arm mode: self-monitoring only | Kadirbay B. | 15 Dec 2026 |
| DOA-23 Rule engine verification on 200 synthetic profiles (SQ1) | Ibrayev A. | 15 Dec 2026 |
| DOA-24 Ethics application to AITU | Ibrayev A. | 31 Dec 2026 |
| DOA-28 … DOA-31 Acceptance tests, usability test, move to a server in Kazakhstan, go/no-go review | see YouTrack | 22–29 Jan 2027 |
| DOA-25 … DOA-27 Pilot study, analysis, thesis and final pre-defense | Ibrayev A. | 30 Apr – 31 May 2027 |

## 4. Demonstration Route

1. **Repository structure:** [README.md](../../README.md), Section 8.
2. **Trace a task to its deliverable:** YouTrack [DOA-8](https://yeralytemir.youtrack.cloud/issue/DOA-8) → branch `docs/DOA-8-requirements` → pull request #11 → [requirements.md](../requirements/requirements.md). The VCS tab of each YouTrack task lists the commits that mention it.
3. **Requirement → use case → screen:** FR in [requirements.md](../requirements/requirements.md) → UC in [use-cases.md](../architecture/use-cases.md) → screen in [docs/prototype/README.md](../prototype/README.md).
4. **Run and test the prototype:** open the [online web build](https://claude.ai/artifact/R7UrdujHwhD1bVwGGv4BXE), or run it locally: `cd mobile && flutter pub get && flutter test && flutter run -d chrome`.
5. **History:** `git log --oneline develop`; each commit message carries its task ID.
