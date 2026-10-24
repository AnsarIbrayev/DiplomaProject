# Supervisor Review Package: Pre-Defense 1

| | |
|---|---|
| **Project** | Development of a Mobile Recommender System for Identifying Obesity Factors and Personalized Weight Management |
| **Pre-defense item** | 11. Supervisor feedback |
| **YouTrack task** | [DOA-14](https://yeralytemir.youtrack.cloud/issue/DOA-14) |
| **Supervisor** | Kashkimbayeva Nurzhamal Meirkulovna (Кашкимбаева Нуржамал Мейркуловна) |
| **Prepared by** | Ibrayev Ansar Umurzakovich (project manager), on behalf of the team |
| **Version / date** | 1.1, 24 October 2026 |
| **Pre-defense date** | 24 October 2026 |

---

## 1. Purpose

This package asks the supervisor to review the pre-defense 1 deliverables and to decide on open questions that the team cannot decide alone. It contains:

| File | Content | For whom |
|---|---|---|
| This file | Status of deliverables 1–10 and the questions for the supervisor | Supervisor |
| [cover-message.md](cover-message.md) | Cover message to send with the package, e-mail and short messenger versions | Team (sender) |
| [feedback-form.md](feedback-form.md) | Feedback form the supervisor may fill in. Optional: comments in any form are accepted | Supervisor |
| [feedback-log.md](feedback-log.md) | Register of every supervisor comment, the team's decision and the change made | Team |

The supervisor's feedback itself is written only by the supervisor. The team records it verbatim in the feedback log and does not paraphrase it as approval.

---

## 2. Status of Deliverables (24 October 2026)

All documents are in the `main` branch of the repository; the submitted version is tagged `prob-period-1`. Links are relative to this file.

| # | Deliverable | Document | Task | Status | What we ask the supervisor to check |
|---|---|---|---|---|---|
| 1 | Project proposal | [proposal.md](../../proposal/proposal.md) | DOA-3 | Draft 1.0, ready for review | Aim, research question SQ1, objectives O1–O4, hypotheses H1–H3, scope |
| 2 | Evidence of relevance | [relevance-summary.md](../../research/relevance-summary.md) | DOA-4 | Report based on verified secondary evidence: published statistics (WHO, NCD-RisC, GBD 2021, WHO STEPS Kazakhstan 2021–2022), literature and the existing-system comparison. Three interviews (two users, one dietitian) were held by Kadirbay B.; only a summary exists ([interview summary](../../research/interviews/interview-summary-kadirbay.md)). An anonymous online survey ([survey-form.md](../../research/survey/survey-form.md)) is planned as validation; no survey data entered yet | Whether this evidence is sufficient for pre-defense 1 (question A2) |
| 3 | Literature review | [literature-review.md](../../research/literature-review.md) | DOA-5 | Complete, 27 sources with an analysis table | Source selection and identified limitations L1–L16 |
| 4 | Existing system comparison | [existing-systems.md](../../research/existing-systems.md) | DOA-6 | Complete: 5 applications, 10 criteria | Choice of systems and criteria |
| 5 | Technology comparison | [technology-comparison.md](../../architecture/technology-comparison.md) | DOA-7 | Complete: 7 decisions (D1–D7) with alternatives | Selected stack: Flutter, FastAPI, PostgreSQL, rule-based engine, AI only for food-logging pre-fill |
| 6 | Functional and non-functional requirements | [requirements.md](../../requirements/requirements.md) | DOA-8 | Complete, v1.4: 40 FR and 28 NFR with priorities and acceptance criteria | Priorities and acceptance criteria |
| 7 | Diagrams (context, use case, component) | [docs/architecture/](../../architecture/) | DOA-9, DOA-10 | Complete: context, use case and component (draft) diagrams; PlantUML sources with PNG / SVG exports; 28 use cases | Whether the system boundary and the components are complete |
| 8 | UX prototype | [prototype/README.md](../../prototype/README.md), code in [`mobile/`](../../../mobile/) | DOA-11 | Complete, v0.1 clickable Flutter app. All data are synthetic; food values are illustrative placeholders | Coverage of the key user scenarios |
| 9 | Verification and evaluation plan | [evaluation-plan.md](../../evaluation/evaluation-plan.md) | DOA-12 | Complete, v1.1. Values marked (T) need confirmation (question B1) | Pilot design, outcome definitions, analysis |
| 10 | Project management and risks | [project-management.md](../../project-management.md) | DOA-13 | Complete, v1.0: roles, workflow, milestones, dependencies, risk register with 17 risks | Milestones and high risks (ethics approval, recruitment, server in Kazakhstan) |
| 11 | Supervisor feedback | This package | DOA-14 | Waiting for the supervisor's review | – |

If the supervisor does not have access to the repository, the team sends the documents as PDF files (see Section 5).

---

## 3. Questions for the Supervisor

### Part A. Needed before pre-defense 1 (24 October 2026)

| # | Question | Context |
|---|---|---|
| A1 | Do you approve the project proposal (aim, SQ1, O1–O4, H1–H3), or what should be changed? | [proposal.md](../../proposal/proposal.md); DOA-3 stays open until your review |
| A2 | For pre-defense 1, is evidence of relevance based on desk research (published statistics, literature and the existing-system comparison) acceptable, with user evidence from a short anonymous online survey added later? Or are 3–5 user interviews required before 24 October? | [relevance-summary.md](../../research/relevance-summary.md); [interview guide](../../research/04-interview-guide.md) is ready if interviews are required |
| A3 | Does an anonymous requirements survey or interview (no measurements, no exact weight, no diagnoses) need AITU ethics approval, or is it acceptable without a formal application? | [03-recruitment-and-consent.md](../../research/03-recruitment-and-consent.md), Section 3.5. The pilot itself is not started before ethics approval (CON-04) |
| A4 | How do you prefer to review: access to the GitHub repository (please share your GitHub username), comments on pull requests, or PDF files by e-mail? Would a short meeting before 24 October be possible? | Pre-defense requirement: the supervisor has access to the repository |

### Part B. Needed before the evaluation plan is frozen (January 2027)

An answer now is welcome but not required for pre-defense 1.

**B1. Team-set values (T) in the evaluation plan.** These values were chosen by the team as design decisions; they are not taken from data or literature. Please mark each one as agreed or give a change.

| # | Value | Current proposal | Section of [evaluation-plan.md](../../evaluation/evaluation-plan.md) |
|---|---|---|---|
| T1 | Randomization | Permuted blocks of random size 2 and 4, stratified by sex and BMI class (25.0–29.9 and 30.0–34.9 kg/m²) | 6.4 |
| T2 | Visit windows | Week 6 and week 12 visits within ±7 days | 6.5 |
| T3 | Time of weighing | Where possible at the same time of day as the baseline visit | 6.6 |
| T4 | Prompt response | Steps in the 60 minutes after a prompt exceed the participant's mean hourly steps during active hours in the baseline week | 6.7 |
| T5 | Valid days for steps (H3) | At least 4 days with step data in the baseline week and in weeks 11–12 | 6.7 |
| T6 | Serious adverse event | Leads to hospital care or prevents daily activities (final definition in the ethics application) | 6.7 |
| T7 | Per-protocol population | Week-12 visit completed and at least one logging event in each of weeks 2–12 | 6.8 |
| T8 | Missing data | Multiple imputation by chained equations, 20 imputations; complete-case analysis reported alongside | 6.8 |
| T9 | AI food-logging accuracy | Correct food among the top 3 suggestions for ≥ 80% of test meals | 4.4 |
| T10 | Rule-base verification | Each of the 200 synthetic profiles also run through 12 simulated weeks | 4.2 |
| T11 | Usability test | 6 participants (2 per interface language), about 45 minutes; problems rated critical, major or minor; every critical problem fixed before enrollment | 5.1 |
| T12 | Defect severity | Critical, major, minor, as defined in the plan | 3.4 |
| T13 | Stopping rule | Enrollment and recommendations paused for supervisor review if a serious adverse event is judged possibly related to a recommendation | 8.3 |
| T14 | Control arm after the pilot | Control participants are offered the full version after their week-12 visit, subject to ethics approval | 8.6 |

The prototype also contains placeholder rule thresholds marked (T) ([prototype/README.md](../../prototype/README.md), Section 1.1). They are replaced when the rule base is formalised (DOA-16) and will be sent for review then.

| # | Question | Context |
|---|---|---|
| B2 | Is a university (AITU) server located in Kazakhstan available for the pilot (February–April 2027), or should the team rent one from a local provider? | Development runs on AWS with synthetic data only; participant data must be stored in Kazakhstan (NFR-06). [technology-comparison.md](../../architecture/technology-comparison.md), Section 9 and assumption A3 |
| B3 | Does the data localization requirement of the Law on Personal Data (Art. 12) apply to a university research prototype, and who at AITU can confirm this? | [requirements.md](../../requirements/requirements.md), NFR-06 and Section 7 |
| B4 | May participants' meal photos or text descriptions be sent to an external AI service for food-logging pre-fill (cross-border transfer)? If not, this feature is switched off for the pilot | FR-40; evaluation plan, Section 8.4 |
| B5 | Does the pre-pilot usability test need its own ethics approval, or can it be covered by the pilot application? | Evaluation plan, Section 11, question 4 |
| B6 | Could a person outside the team (for example, an AITU volunteer) take the week-6 and week-12 measurements, so that the assessor is blinded? | Evaluation plan, Sections 6.4 and 11 |
| B7 | Should the pilot be registered in a public trial registry? | Evaluation plan, Section 6.10 |

---

## 4. How Feedback Is Recorded

1. The supervisor gives feedback in any form: the [feedback form](feedback-form.md), e-mail, a meeting, or comments on GitHub pull requests.
2. Within one day, the team copies each comment verbatim into the [feedback log](feedback-log.md) with a date and source.
3. For each comment, the team records a decision (accepted, partly accepted with reason, or discussed and not accepted with reason) and links the pull request that makes the change.
4. Meeting minutes are written from [`docs/meetings/TEMPLATE.md`](../TEMPLATE.md) as `docs/meetings/YYYY-MM-DD-supervisor.md`.
5. DOA-14 is closed when every comment has a decision and, where a change was made, a link (DOA-14 acceptance criteria).

---

## 5. Sending the Package

| Step | Action | Who |
|---|---|---|
| 1 | Send the cover message ([cover-message.md](cover-message.md)) with this package and the feedback form | Ansar Ibrayev |
| 2 | Attach the consolidated PDF report of all 11 items submitted with the pre-defense form (tag `prob-period-1`) | Ansar Ibrayev |
| 3 | Record the feedback in the log and open pull requests for the changes | Team |
