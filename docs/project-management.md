# Project Management Plan

| | |
|---|---|
| **Project** | Development of a Mobile Recommender System for Identifying Obesity Factors and Personalized Weight Management |
| **Document type** | Project management and risks (pre-defense item 10) |
| **YouTrack task** | [DOA-13](https://yeralytemir.youtrack.cloud/issue/DOA-13) |
| **Version / date** | 1.0, 22 October 2026 |
| **Inputs** | [Project proposal](proposal/proposal.md) (Sections 1, 9, 10); [Requirements specification](requirements/requirements.md) (Section 5, constraints CON-01 – CON-04); [Technology comparison](architecture/technology-comparison.md) (Section 10, assumptions and risks); [Evaluation plan](evaluation/evaluation-plan.md) (Sections 7–11); YouTrack project DOA (tasks DOA-1 – DOA-27, state on 22 October 2026) |

---

## Summary

The project runs from 15 October 2026 to 31 May 2027 and is planned as 27 tasks in the YouTrack project DOA. Each task has an assignee, a priority, a start date and a deadline. Work moves through four stages: pre-defense 1 (October 2026), development and verification (November–December 2026), preparation and pilot study (January–April 2027), and analysis and thesis (May 2027). The critical path runs through the rule base, the rule engine, its verification and the ethics approval to the pilot study, because no participant can be enrolled before all of them are complete (evaluation plan, Section 7).

The risk register (Section 6) lists 17 risks. Seven are rated high: a delay of the ethics approval, slow recruitment, drop-out in the pilot, the availability of a server in Kazakhstan for participant data, the compressed development schedule in November 2026, unverified user assumptions, and unsafe or wrong recommendations.

---

## 1. Team and Responsibilities

| Member | Role | Responsibilities | YouTrack login |
|---|---|---|---|
| Ibrayev Ansar Umurzakovich | Project manager, analyst | Planning and tracking in YouTrack; formalization of the recommendation rule base (O1); system verification (SQ1); requirements and evaluation plan; ethics application; pilot study as research assistant (RA); analysis of results | `ibrayevansar07` |
| Temirbulatov Yeraly Chingizovich | Mobile client developer | Flutter client: onboarding, logging, recommendation screens, notifications, wearable integration; YouTrack administration | `admin` |
| Kadirbay Bibarys Asylkhanuly | Backend developer | FastAPI backend, PostgreSQL schema, authentication and REST API, rule engine service, control-arm mode, deployment | `BibarysK` |

**Supervisor:** Kashkimbayeva Nurzhamal Meirkulovna. The supervisor reviews key deliverables before each pre-defense, confirms open methodological questions (Section 7) and is informed of any adverse event during the pilot (evaluation plan, Section 8.3).

Thesis writing and the preparation of pre-defense materials are shared by all members (proposal, Section 1).

### 1.1 Responsibility matrix (RACI)

R = responsible (does the work), A = accountable (approves), C = consulted, I = informed.

| Work package | Tasks | Ansar | Yeraly | Bibarys | Supervisor |
|---|---|---|---|---|---|
| Pre-defense 1 documents | DOA-2 – DOA-8, DOA-12 – DOA-14 | R, A | C | C | C |
| Architecture and diagrams | DOA-9, DOA-10 | A | R (DOA-10) | R (DOA-9) | I |
| Prototype | DOA-11 | A | R | C | I |
| Repository setup | DOA-1 | A | C | R | I |
| Rule base (O1) | DOA-16 | R, A | I | C | C |
| Backend, rule engine, control arm | DOA-17, DOA-18, DOA-22 | A | C | R | I |
| Mobile client and wearables | DOA-19 – DOA-21 | A | R | C | I |
| Rule-engine verification (SQ1) | DOA-23 | R, A | C | C | I |
| Ethics application | DOA-24 | R, A | C | C | C |
| Pilot study | DOA-25 | R, A | C | C | I |
| Analysis and thesis | DOA-26, DOA-27 | R, A | R (DOA-27) | R (DOA-27) | C |

Assignees in this matrix follow the YouTrack tasks. Ansar is accountable for all work packages because he is the project manager.

---

## 2. Tools and Workflow

### 2.1 Tools

| Tool | Purpose | Link |
|---|---|---|
| YouTrack (project DOA) | Tasks, assignees, priorities, deadlines, stages, dependencies | https://yeralytemir.youtrack.cloud/issues/DOA |
| YouTrack Gantt chart «DOA – Diploma plan» | Timeline built from Start Date, Estimation and «depends on» links | YouTrack → Gantt charts → «DOA – Diploma plan» |
| GitHub repository | Code, documents, diagrams, pull requests, tags | https://github.com/AnsarIbrayev/DiplomaProject |
| GitHub–YouTrack integration | Commits and branches that contain a task ID appear in the VCS tab of the YouTrack task | Configured in YouTrack, 22 October 2026 |
| Claude Code (AI coding assistant) | Writes code and document drafts on separate branches; every change goes through a pull request | Technology comparison, assumption A1 |

### 2.2 Task life cycle in YouTrack

Every task description follows one template: expected outcome, steps, acceptance criteria (checkboxes), deliverable and traceability. Progress is recorded in the **Stage** field:

| Stage (UI: Russian) | Meaning |
|---|---|
| Backlog (Очередь) | Planned, not started |
| Develop (Разработка) | In progress |
| Review (Ревью) | Deliverable ready, waiting for approval or for the supervisor |
| Test, Staging | Used for software tasks from DOA-17 onwards |
| Done (Готово) | All acceptance criteria are ticked and the pull request link is added to the task |

A task is moved to Done only when its acceptance criteria are met and the deliverable is merged into `develop`.

### 2.3 Git workflow

The rules are in [CONTRIBUTING.md](../CONTRIBUTING.md). In short:

| Element | Rule |
|---|---|
| `main` | Stable version; changed only through a pull request from `develop`; pre-defense tags are placed here |
| `develop` | Integration branch for current work |
| Working branches | Created from `develop`: `feature/`, `fix/` or `docs/<ID>-<description>`. Branches opened by the AI assistant are named `claude/<session>`; their commits and pull requests carry the task ID |
| Commits | `<type>(<area>): <description> [<ID>]`, for example `docs(evaluation): verification and evaluation plan [DOA-12]` |
| Pull requests | Into `develop`, using the repository template: YouTrack task, what was done, how to check it, checklist (branch from `develop`, commit format, no secrets or personal data). The project manager approves the content before merge |
| Tags | `pre-defense-1`, `pre-defense-2`, `final-pre-defense` on the submitted commit of `main`; a tag is never moved after submission |
| Data protection | No secrets, keys or participant data in the repository (NFR-08) |

Traceability chain: **YouTrack task → branch and commits with the task ID → pull request → merged deliverable → task Done with the PR link.** For example, DOA-12 → PR #17 and PR #19 → `docs/evaluation/evaluation-plan.md` → DOA-12 Done.

### 2.4 Communication

- Supervisor meetings are recorded in `docs/meetings/` with [TEMPLATE.md](meetings/TEMPLATE.md): discussion, decisions, tasks with owner and deadline.
- Supervisor comments on documents are recorded in a feedback log with the decision taken and the commit or PR that addresses them (DOA-14).
- Decisions that change scope or requirements are recorded in the affected document (version history or "resolved" note) and in the YouTrack task.

---

## 3. Milestones

Dates are taken from the Start Date and Due Date fields of the YouTrack tasks.

| No. | Milestone | Date | Tasks | Completion evidence |
|---|---|---|---|---|
| M1 | **Pre-defense 1** | 24 Oct 2026 | DOA-1 – DOA-15 | Tag `pre-defense-1` on `main`; submission package (DOA-15) |
| M2 | Rule base, backend, rule engine and mobile client implemented | 30 Nov 2026 | DOA-16 – DOA-21 | Merged PRs; rule base document; working build on Android |
| M3 | Control-arm mode and rule-engine verification (SQ1) | 15 Dec 2026 | DOA-22, DOA-23 | `docs/evaluation/verification-report.md`: 0 hard-constraint violations |
| M4 | Ethics application decided | 31 Dec 2026 | DOA-24 | Decision recorded in `docs/ethics/` without personal data |
| M5 | Go/no-go before enrollment | Jan 2027 | DOA-22, DOA-25 (evaluation plan, Sections 7, 10) | All 10 go/no-go criteria met, including the server in Kazakhstan and the usability test |
| M6 | **Pre-defense 2** | Date set by AITU (not yet announced) | DOA-27 | Tag `pre-defense-2` |
| M7 | Pilot study completed (12 weeks) | 1 Feb – 30 Apr 2027 | DOA-25 | `docs/evaluation/pilot-log.md`; CONSORT-style flow |
| M8 | Analysis of H1–H3, feasibility and safety | 1 – 15 May 2027 | DOA-26 | Analysis scripts in `ml/`; results tables |
| M9 | **Final pre-defense** and thesis submission | by 31 May 2027 | DOA-27 | Tag `final-pre-defense`; thesis text |

### 3.1 Task schedule

| Period | Tasks | Assignee |
|---|---|---|
| 15 – 24 Oct 2026 | DOA-1 Repository setup | Bibarys |
| | DOA-2 README, DOA-3 Proposal, DOA-4 Evidence of relevance, DOA-8 Requirements, DOA-12 Evaluation plan, DOA-13 Project management, DOA-14 Supervisor feedback, DOA-15 Submission | Ansar |
| | DOA-5 Literature review, DOA-6 Existing systems, DOA-10 Use case diagram, DOA-11 Prototype | Yeraly |
| | DOA-7 Technology comparison, DOA-9 Context and component diagrams | Bibarys |
| 26 Oct – 30 Nov 2026 | DOA-16 Rule base (O1) | Ansar |
| | DOA-17 Backend: schema, authentication, REST API; DOA-18 Rule engine service | Bibarys |
| | DOA-19 Mobile: onboarding and logging; DOA-20 Mobile: recommendations and prompts; DOA-21 Wearable integration | Yeraly |
| 16 Nov – 15 Dec 2026 | DOA-22 Control-arm mode | Bibarys |
| | DOA-23 Rule-engine verification on 200 synthetic profiles (SQ1) | Ansar |
| 1 – 31 Dec 2026 | DOA-24 Ethics application | Ansar |
| 1 Feb – 30 Apr 2027 | DOA-25 Pilot study | Ansar |
| 1 – 15 May 2027 | DOA-26 Data analysis | Ansar |
| 1 Nov 2026 – 31 May 2027 | DOA-27 Thesis text and final pre-defense | Ansar (whole team writes) |

January 2027 has no separate YouTrack task. According to the evaluation plan (Section 10) it holds the acceptance tests, the usability test, the move to the server in Kazakhstan and the go/no-go review. Separate tasks for these activities should be created before December 2026 (Section 7, item 4).

---

## 4. Dependencies

### 4.1 Dependencies between tasks

These «depends on» links are set in YouTrack and drive the Gantt chart.

| Task | Depends on |
|---|---|
| DOA-2 README | DOA-1 Repository setup |
| DOA-8 Requirements | DOA-4 Evidence of relevance, DOA-5 Literature review, DOA-6 Existing systems |
| DOA-9 Context and component diagrams | DOA-8 Requirements, DOA-10 Use case diagram |
| DOA-10 Use case diagram | DOA-8 Requirements |
| DOA-11 Prototype | DOA-10 Use case diagram |
| DOA-12 Evaluation plan | DOA-3 Proposal, DOA-8 Requirements |
| DOA-16 Rule base | DOA-15 Pre-defense 1 submission |
| DOA-18 Rule engine service | DOA-16 Rule base, DOA-17 Backend |
| DOA-20 Recommendations screen | DOA-18 Rule engine service, DOA-19 Mobile logging |
| DOA-21 Wearable integration | DOA-19 Mobile logging |
| DOA-22 Control-arm mode | DOA-17 Backend |
| DOA-23 Verification (SQ1) | DOA-18 Rule engine service |
| DOA-25 Pilot study | DOA-22 Control-arm mode, DOA-23 Verification, DOA-24 Ethics approval |
| DOA-26 Data analysis | DOA-25 Pilot study |

**Critical path to the pilot:** DOA-16 → DOA-18 → DOA-23 → DOA-25 → DOA-26 → DOA-27, with DOA-24 (ethics) as a parallel precondition of DOA-25. A delay on this path moves the pilot, and the pilot cannot be shortened below 12 weeks without changing the study design.

### 4.2 External dependencies

| Dependency | Needed for | Owner | Status on 22 Oct 2026 |
|---|---|---|---|
| Supervisor review of deliverables | Each pre-defense; open methodological questions | Ansar | Proposal ready for supervisor review (DOA-3 in Review); feedback log in DOA-14 |
| AITU ethics committee approval | Usability test and pilot (CON-04) | Ansar | Application planned for December 2026 (DOA-24) |
| Server located in Kazakhstan | Storage of participant data (NFR-06) | Bibarys | Not yet arranged; university server or local provider to be agreed with the supervisor (technology comparison, A3) |
| AWS Free plan | Development environment with synthetic data only | Bibarys | Selected; free RDS for up to six months for new accounts (technology comparison, Section 9) |
| Respondents for interviews | Verification of user assumptions A1–A12 (DOA-4) | Ansar | Interview kit ready; interviews not conducted; assumptions unverified |
| Pilot participants (target 60) | DOA-25 | Ansar | Recruitment only after ethics approval |
| Google Health Connect and Apple HealthKit, `health` plugin | Step and heart-rate data (DOA-21) | Yeraly | Selected (technology comparison, D6) |
| Mac with Xcode and Apple developer account | Building and testing the iOS app, HealthKit on a device | Yeraly | To be confirmed (technology comparison, R3) |
| Food composition data that cover local foods | Logging and nutrition rules (FR-07) | Ansar | Local-food test list planned in DOA-16 |
| Paid multimodal AI service | AI-assisted food logging (FR-40) | Bibarys | Provider selected at implementation; the only paid exception to CON-01 |
| Native speakers of Kazakh, Russian and English | Review of explanations and notifications before the pilot | Ansar | Go/no-go criterion 7 (evaluation plan, Section 7) |

---

## 5. Risk Assessment Method

Each risk is rated by the team on two three-level scales. The ratings are the team's judgement on 22 October 2026, not measured values, and are reviewed at each milestone.

| Level | Likelihood | Impact |
|---|---|---|
| **High (3)** | More likely than not to happen during the project | Moves a milestone by more than a month, removes an objective (O1–O4) or stops the pilot |
| **Medium (2)** | May happen | Moves a milestone by up to a month or reduces the quality of a deliverable |
| **Low (1)** | Unlikely | Absorbed within the task without moving a milestone |

**Score** = likelihood × impact (1–9). Risks scoring 6 or more are **high** and are reviewed at every supervisor meeting; 3–4 are **medium**; 1–2 are **low**.

---

## 6. Risk Register

| ID | Risk | Category | L | I | Score | Mitigation | Contingency (if it happens) | Owner | Tasks |
|---|---|---|---|---|---|---|---|---|---|
| R01 | Ethics approval is delayed or requires major changes, so enrollment cannot start in February 2027. | Ethics | 2 | 3 | **6** | Submit early in December 2026; ask the supervisor about the required documents and committee schedule in November; reuse the consent and data-protection text already written in the evaluation plan (Section 8). | Shorten recruitment, not the 12-week intervention; if the start moves past March 2027, discuss with the supervisor a smaller sample reported as a feasibility study. | Ansar | DOA-24, DOA-25 |
| R02 | Slow recruitment: fewer than 60 eligible participants are randomized. | Pilot | 2 | 3 | **6** | Recruit through AITU channels, posters and social media from the day of approval (proposal, Section 9); monitor the recruitment rate weekly. | Report the actual sample and recruitment rate as feasibility outcomes; the study is a pilot and is not powered for confirmation (evaluation plan, Section 6.3). | Ansar | DOA-25 |
| R03 | Drop-out and missing measurements at weeks 6 and 12. | Pilot | 3 | 2 | **6** | Study reminders, ±7-day visit windows, weekly check-in (evaluation plan, Sections 6.5, 9). | Intention-to-treat analysis with multiple imputation and complete-case comparison (evaluation plan, Section 6.8). | Ansar | DOA-25, DOA-26 |
| R04 | No server located in Kazakhstan is available in time, so participant data cannot be stored as NFR-06 requires. | Legal, infrastructure | 2 | 3 | **6** | Ask the supervisor about a university server in November 2026; in parallel, list local hosting providers; keep the same containers and schema as on AWS so the move is a redeployment. | Go/no-go criterion 5 is not met: enrollment waits until the server is ready. | Bibarys | DOA-17, DOA-25 |
| R05 | Development schedule is compressed: rule base, backend, rule engine and the mobile client are all due on 30 November 2026. | Schedule | 3 | 2 | **6** | Weekly progress check in YouTrack; Must requirements first (MoSCoW); code written with the AI coding assistant and checked by tests in CI; Android first (R12). | Move Should and Could requirements after the pilot; keep the 15 December verification date because it is on the critical path. | Ansar | DOA-16 – DOA-21 |
| R06 | Legal rules on personal-data localization and cross-border transfer change or are interpreted differently for a university prototype. | Legal | 2 | 2 | 4 | Design for storage in Kazakhstan regardless of the outcome (technology comparison, R1); confirm the interpretation with the supervisor and the ethics committee (requirements, Section 7). | Follow the stricter reading. | Ansar | DOA-24 |
| R07 | Sending meal text or photos to an external AI service is not approved (cross-border transfer, photos with faces or metadata). | Ethics, legal | 2 | 1 | 2 | Safeguards in the ethics application: no identifiers, metadata removal, opt-out of retention, separate consent (evaluation plan, Section 8.4). | Switch FR-40 off in both arms; manual logging remains complete. | Ansar | DOA-24 |
| R08 | Cost of the paid AI service exceeds what the team can pay. | Cost | 1 | 2 | 2 | Send short text and compressed photos; set a spending limit in the provider account where available; one backend interface so the provider can be replaced (technology comparison, D7). | Switch the feature off; it does not affect any other function. | Bibarys | DOA-17 |
| R09 | AWS free use ends before the move to Kazakhstan, so development hosting starts to cost money. | Cost, infrastructure | 2 | 1 | 2 | Free RDS lasts up to six months for new accounts (technology comparison, A2); the move is planned before February 2027; only synthetic data are stored there. | Run the development database locally or on the Kazakhstan server earlier. | Bibarys | DOA-17 |
| R10 | User interviews (DOA-4) are not conducted, so user assumptions A1–A12 stay unverified. | Requirements | 3 | 2 | **6** | Requirements that depend on unverified assumptions are labelled and listed (requirements, Section 6.3); the January usability test and pilot feasibility data provide user evidence later. | Report the assumptions as a limitation in the thesis; adjust thresholds after the usability test. | Ansar | DOA-4, DOA-8 |
| R11 | A recommendation is unsafe or wrong for a user profile (rule error). | Safety, quality | 2 | 3 | **6** | Hard-constraint checker; verification on 200 synthetic profiles with 0 violations required (SQ1); eligibility screening and PAR-Q+; weekly adverse-event check-in (evaluation plan, Sections 4, 8). | Suspend recommendations for the affected account (FR-29); stopping rule: pause enrollment and review with the supervisor. | Ansar | DOA-16, DOA-23, DOA-25 |
| R12 | iOS build and HealthKit testing are blocked without a Mac, Xcode and an Apple developer account. | Technical | 2 | 2 | 4 | Confirm access early; develop and test on Android first (technology comparison, R3). | Limit the pilot to Android users and report this as a limitation. | Yeraly | DOA-19 – DOA-21 |
| R13 | Wearable and step data are incomplete because of platform limits, permissions or changes in the `health` plugin. | Technical | 2 | 2 | 4 | Pin the plugin version; phone step counter as default source; one step source per participant (technology comparison, R2; evaluation plan, Section 9). | Report data completeness as a feasibility outcome; analyse H3 on valid days only. | Yeraly | DOA-21 |
| R14 | Local foods are missing in the food database, so logging and nutrition rules are inaccurate. | Data | 2 | 2 | 4 | Local-food test list in DOA-16; custom foods (FR-08); AI suggestions only from the project's own database. | Extend the local-food list during the usability test. | Ansar | DOA-16, DOA-19 |
| R15 | Team capacity: three students with parallel coursework; one member unavailable delays a work package. | Team | 2 | 2 | 4 | Each work package has one owner in YouTrack; all code and documents are in the repository and reviewed through PRs, so another member can continue the work. | The project manager re-assigns the task in YouTrack and moves Could requirements out of scope. | Ansar | All |
| R16 | Supervisor feedback arrives late before a pre-defense, leaving no time to revise. | Schedule | 2 | 2 | 4 | Send drafts at least one week before each pre-defense; record feedback in DOA-14 with the PR that addresses it. | Submit with a list of comments still being addressed. | Ansar | DOA-14 |
| R17 | AITU rules on the use of AI tools in a diploma project are unclear, and AI-written code or text is questioned. | Academic | 1 | 3 | 3 | Disclose the use of the AI coding assistant in the thesis and repository (technology comparison, A1); confirm the rules with the supervisor; every change is traceable through PRs. | Follow the supervisor's guidance on attribution. | Ansar | DOA-27 |

L = likelihood, I = impact (Section 5).

### 6.1 Risk matrix

| Likelihood ↓ / Impact → | Low (1) | Medium (2) | High (3) |
|---|---|---|---|
| **High (3)** | | R03, R05, R10 | |
| **Medium (2)** | R07, R09 | R06, R12, R13, R14, R15, R16 | R01, R02, R04, R11 |
| **Low (1)** | | R08 | R17 |

### 6.2 Risk review

- The register is reviewed at each milestone in Section 3 and before each supervisor meeting. Changes in rating are recorded in this document's version history.
- A risk that occurs is recorded as a YouTrack task linked to the affected task, with the contingency action.
- High risks (score ≥ 6) are reported in each pre-defense package.

---

## 7. Open Items

1. **Pre-defense 2 date.** Not yet announced by AITU; the milestone is added to YouTrack when it is known.
2. **Server in Kazakhstan** (R04). Ask the supervisor whether a university server can host the pilot database.
3. **Ethics committee schedule** (R01). Ask the supervisor which documents are needed and when the committee meets.
4. **January 2027 tasks.** Create YouTrack tasks for the acceptance tests, the usability test, the move to the server in Kazakhstan and the go/no-go review (evaluation plan, Section 10).
5. **Use of AI tools** (R17). Confirm the AITU rules on disclosing the use of an AI coding assistant.

---

## Version History

| Version | Date | Change |
|---|---|---|
| 1.0 | 22 Oct 2026 | First version for pre-defense 1 |
