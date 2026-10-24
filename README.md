# Development of a Mobile Recommender System for Identifying Obesity Factors and Personalized Weight Management

«Разработка мобильной рекомендательной системы для выявления факторов ожирения и персонализированного управления весом»

Diploma project · Astana IT University · School of Software Engineering · 2026–2027

A cross-platform mobile application with a backend that screens adults with overweight or class I obesity, collects dietary, weight and activity data, identifies each user's modifiable lifestyle factors that deviate most from guideline-based targets, and gives joint nutrition and physical activity recommendations produced by transparent, versioned rules. Every recommendation shows the rule that produced it. The system is evaluated in a 12-week, two-arm randomized pilot against a self-monitoring-only version of the same application.

| | |
|---|---|
| **YouTrack project** | [DOA](https://yeralytemir.youtrack.cloud/projects/DOA) (tasks DOA-1 … DOA-31) |
| **Current stage** | Pre-defense 1 (24 October 2026): analysis, design, planning and clickable prototype |
| **Pre-defense 1 submission** | [docs/defense/pre-defense-1.md](docs/defense/pre-defense-1.md) |
| **Prototype** | Clickable Flutter app in [`mobile/`](mobile/), screens in [docs/prototype](docs/prototype/README.md) (no Figma file: the prototype is coded) |

---

## 1. Problem Statement

Mobile weight-management applications are scalable, but their measured benefit is small and depends on the comparator: against active self-monitoring, automated tailored feedback has not improved weight loss. Current tools usually personalize one behavior at a time (nutrition *or* activity), rarely explain their recommendations, and define engagement inconsistently. As a result, a person who wants to manage their weight without clinical supervision has no transparent tool that (a) identifies which of their own modifiable lifestyle factors contribute most to excess weight, (b) turns them into joint, guideline-constrained nutrition and activity recommendations, and (c) explains every recommendation. Whether such a system improves engagement and weight-related outcomes over plain self-monitoring has not been tested in a controlled study in Central Asia.

Full statement with sources: [proposal, Section 2](docs/proposal/proposal.md#2-problem-statement). Evidence: [relevance summary](docs/research/relevance-summary.md), [literature review](docs/research/literature-review.md), [existing system comparison](docs/research/existing-systems.md).

## 2. Target Users

- **Primary users:** adults aged 18–60 years with overweight or class I obesity (BMI 25.0–34.9 kg/m²) who own an Android or iOS smartphone and do not require clinical supervision for weight management.
- **Excluded users** (referred to clinical care, no recommendations): people with diagnosed diabetes or cardiovascular disease, pregnant women, people taking weight-loss medication, people with PAR-Q+ contraindications.
- **Secondary stakeholders:** the research team (pilot administration, pseudonymized data export) and the supervisor.

Source: [proposal, Section 3](docs/proposal/proposal.md#3-target-users).

## 3. Aim, Objectives and Expected Outcomes

**Aim.** To design, implement and evaluate a transparent, rule-based mobile recommender system that identifies each user's modifiable obesity-related lifestyle factors and jointly personalizes nutrition and physical activity recommendations.

| ID | Objective |
|---|---|
| O1 | Formalize an explainable rule base that identifies deviating lifestyle factors and converts guidelines into personalized nutrition and activity targets |
| O2 | Develop a cross-platform prototype (mobile client, backend, rule engine) and verify its outputs on 200 synthetic profiles (SQ1) |
| O3 | Compare 12-week engagement between the recommender arm and a self-monitoring control arm (H1) |
| O4 | Compare weight-related outcomes and safety between the arms (H2, H3) |

**Expected outcomes:** a verifiable rule base; a working cross-platform prototype with setup and test instructions; a verification report on 200 synthetic profiles; pilot effect estimates (planned n = 60); the thesis and repository documentation. Details: [proposal, Sections 4–6](docs/proposal/proposal.md#4-aim-and-research-questions).

## 4. Scope

**In scope:** eligibility screening and referral; user profile; identification of modifiable lifestyle factors; food, weight and step logging (optionally from wearables via Health Connect / HealthKit); rule-based, explained recommendations and activity prompts; a self-monitoring-only mode for the control arm; weekly adverse-event check-in; engagement logging and pseudonymized export; verification on synthetic profiles and a 12-week pilot.

**Out of scope:** medical diagnosis and clinical decisions; medication or supplements; users who need medical management, BMI ≥ 35 kg/m², children; genetic, laboratory or socioeconomic factors; recommendations from opaque models that cannot be traced to a rule; human coaching; app-store release.

Full lists: [proposal, Section 7](docs/proposal/proposal.md#7-project-scope).

## 5. Team and Supervisor

| Member | Role | Responsibilities |
|---|---|---|
| Ibrayev Ansar Umurzakovich (Ибраев Ансар Умурзакович) | Project manager, analyst | Project management; formalization of the recommendation rule base; system verification; organization of the pilot study |
| Temirbulatov Yeraly Chingizovich (Темирбулатов Ералы Чингизович) | Mobile client developer | Cross-platform mobile client |
| Kadirbay Bibarys Asylkhanuly (Кәдірбай Бибарыс Асылханұлы) | Backend developer | Server side, data storage and API |

**Supervisor:** Kashkimbayeva Nurzhamal Meirkulovna (Кашкимбаева Нуржамал Мейркуловна).

Responsibility matrix (RACI): [project management plan, Section 1](docs/project-management.md#1-team-and-responsibilities).

## 6. Selected Technologies

| Layer | Technology |
|---|---|
| Mobile client | Flutter (Dart), Android 9+ and iOS 15+, one code base for both study arms |
| On-device storage | SQLite (`drift`) as an offline queue |
| Wearable and phone data | Health Connect (Android), HealthKit (iOS) through the `health` plugin |
| Backend | FastAPI (Python) |
| API | REST with an OpenAPI description; Dart client generated from it |
| Database | PostgreSQL; during the pilot on a server in Kazakhstan |
| Recommendation engine | Declarative, versioned rule base with a Python evaluator and hard-constraint checker |
| AI assistance | Language-model API for food-logging suggestions only, confirmed by the user; never generates or ranks recommendations |
| Development hosting | AWS Free plan, synthetic and test data only |

Alternatives and justification: [technology comparison](docs/architecture/technology-comparison.md).

## 7. Current Status (24 October 2026)

| No. | Pre-defense 1 component | Document | YouTrack | Status |
|---|---|---|---|---|
| 1 | Project proposal | [docs/proposal/proposal.md](docs/proposal/proposal.md) | DOA-3 | Draft for supervisor review |
| 2 | Evidence of relevance | [docs/research/relevance-summary.md](docs/research/relevance-summary.md), [docs/research/](docs/research/README.md) | DOA-4 | Secondary evidence and 3 interviews (2 users, 1 dietitian, summary only); survey pending |
| 3 | Literature review | [docs/research/literature-review.md](docs/research/literature-review.md), source registry [research/literature/](research/literature/README.md) | DOA-5 | Done |
| 4 | Existing system comparison | [docs/research/existing-systems.md](docs/research/existing-systems.md) | DOA-6 | Done |
| 5 | Technology comparison | [docs/architecture/technology-comparison.md](docs/architecture/technology-comparison.md) | DOA-7 | Done |
| 6 | Requirements specification | [docs/requirements/requirements.md](docs/requirements/requirements.md) | DOA-8 | Done (40 FR, 28 NFR) |
| 7 | Architecture and diagrams | [docs/architecture/architecture.md](docs/architecture/architecture.md), [use-cases.md](docs/architecture/use-cases.md), [diagrams/](docs/architecture/diagrams/README.md) | DOA-9, DOA-10 | Done (PlantUML sources + PNG/SVG) |
| 8 | UX / prototype | [docs/prototype/README.md](docs/prototype/README.md), code in [mobile/](mobile/) | DOA-11 | Clickable prototype, synthetic demo data |
| 9 | Verification and evaluation plan | [docs/evaluation/evaluation-plan.md](docs/evaluation/evaluation-plan.md) | DOA-12 | Done |
| 10 | Project management and risks | [docs/project-management.md](docs/project-management.md) | DOA-13 | Done |
| 11 | Supervisor feedback | [docs/meetings/](docs/meetings/2026-10-supervisor-review/README.md) | DOA-14 | Package prepared; no meeting or feedback yet |

The backend (`backend/`), the production rule engine and the verification code (`ml/`) are not implemented yet; they are planned in DOA-16 … DOA-23 (November–December 2026).

## 8. Repository Structure

```
├── mobile/                  Flutter client (clickable prototype), its tests in mobile/test/
├── backend/                 FastAPI backend (from DOA-17)
├── ml/                      rule-base verification and pilot analysis (from DOA-23)
├── tests/                   cross-component and acceptance test materials
├── docs/
│   ├── proposal/            project proposal
│   ├── research/            evidence of relevance, literature review, existing systems, survey and interview kit
│   ├── requirements/        FR / NFR with priorities and acceptance criteria
│   ├── architecture/        architecture, technology comparison, use cases
│   │   └── diagrams/        PlantUML sources (.puml) and PNG / SVG exports
│   ├── prototype/           prototype description and screenshots
│   ├── evaluation/          verification and evaluation plan
│   ├── project-management.md  roles, milestones, dependencies, risk register
│   ├── meetings/            supervisor meetings and feedback log
│   ├── defense/             pre-defense submission packages
│   └── thesis/              thesis chapters (drafts)
├── research/
│   ├── literature/          source registry (full texts are not stored)
│   └── datasets/            dataset descriptions
├── .env.example             configuration example with placeholder values
└── CONTRIBUTING.md          branch, commit and pull request rules
```

## 9. Setup, Run and Test

Only the mobile prototype is runnable at this stage. It needs the [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel).

```bash
cd mobile
flutter pub get
flutter run -d chrome   # in a browser
flutter run             # on an Android 9+ or iOS 15+ device or emulator
flutter test            # rule, widget and localization tests
```

Demo links and screens: [mobile/README.md](mobile/README.md), [docs/prototype/README.md](docs/prototype/README.md). The prototype uses synthetic demo data only and has no backend.

Backend configuration will be read from environment variables; copy [.env.example](.env.example) to `.env` and fill in local values. `.env` is ignored by Git.

## 10. Workflow

- Tasks: YouTrack project [DOA](https://yeralytemir.youtrack.cloud/projects/DOA). Each task has an assignee, priority, start date, deadline and acceptance criteria.
- Branches `docs/DOA-N-…`, `feature/DOA-N-…`, `fix/DOA-N-…` from `develop`; commits `<type>(<area>): <description> [DOA-N]`; pull requests into `develop`; `main` is the reviewed baseline. Rules: [CONTRIBUTING.md](CONTRIBUTING.md).
- Each pre-defense submission is tagged: `pre-defense-1`, `pre-defense-2`, `final-pre-defense`.
- No passwords, keys or personal data are committed.
