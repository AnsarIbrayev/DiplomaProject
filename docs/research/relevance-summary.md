# 6. Relevance Summary: Analysis Procedure and Report

| | |
|---|---|
| **YouTrack task** | [DOA-4](https://yeralytemir.youtrack.cloud/issue/DOA-4) |
| **Status** | Report based on verified secondary evidence (S1–S3). Three interviews (S5) were conducted by Kadirbay B.; their summary is linked below and the full records are being added. The user survey (S4) and further interviews are planned validation. |

## 6.1 Analysis procedure (for interviews S5; the survey S4 uses the rule in [survey/survey-form.md](survey/survey-form.md))

| Step | Action | Output |
|---|---|---|
| 1 | Complete one record per interview within 24 hours (template in [05-results-template.md](05-results-template.md)). | `interviews/P1.md` ... `P5.md` |
| 2 | Split notes into atomic findings (one statement each) and label each as behaviour (B), opinion (O) or interpretation (I). | Findings `P<n>-F<k>` |
| 3 | Group similar findings from different participants into themes (affinity mapping). Name each theme by what participants said, not by the planned feature. | Theme table (6.3) |
| 4 | For each assumption, count supporting and contradicting participants. Count only B and O findings; I findings are not evidence. | Assumption tally (6.4) |
| 5 | Assign a status using the decision rule fixed in advance ([02-assumptions-register.md](02-assumptions-register.md), Section 2.1). Update the register. | Updated register |
| 6 | Derive or adjust requirements. Every requirement that relies on user evidence cites its findings; requirements based on unverified assumptions are labelled as such. | Traceability table (6.5); input to `docs/requirements/requirements.md` |
| 7 | Write the summary (Section 6.2) and one pre-defense slide (Section 6.6). | Summary and slide |

A second team member should check steps 3–5 independently for at least two interviews, and disagreements are noted in the summary. This reduces the risk that the interviewer reads the expected answer into the notes.

## 6.2 Evidence of relevance report

> **Update, 24 October 2026.** Three interviews (two target users, I1–I2, and one clinical nutritionist / dietitian, I3) were conducted by Kadirbay B. before 23 October 2026 (confirmed by the team on 24 October 2026). His summary is in [interviews/interview-summary-kadirbay.md](interviews/interview-summary-kadirbay.md). Anonymised records with date, mode and notes (template [05](05-results-template.md)) are being added. Until the records are in the repository, the interview findings are reported as stated in that summary and are not yet used to change the status of assumptions in Section 3.
>
> **Status, 22 October 2026.** Item 2 is presented on the basis of **secondary evidence**: analysis of available data, published studies of users of weight-management applications, and a structured comparison of existing systems. All of it is verified against cited sources. **Primary user evidence (online survey and interviews) has not been collected yet.** It is planned as validation and is labelled as such everywhere below. No user responses, quotations or numbers from users are reported in this document.

### 1. Evidence streams

| Stream | Evidence type (committee list) | Status | Document |
|---|---|---|---|
| S1. Prevalence statistics, world, Kazakhstan, Astana region | Analysis of available data | **Complete** | [01-desk-research.md](01-desk-research.md) |
| S2. Published studies of users of digital weight-management tools | Analysis of available data (peer-reviewed studies) | **Complete** | [literature-review.md](literature-review.md), Sections 3.2–3.3 |
| S3. Comparison of five existing applications on 10 criteria | Observation of relevant systems (official descriptions) | **Complete**; hands-on check pending | [existing-systems.md](existing-systems.md) |
| S4. Online survey of potential users (Google Forms, RU/KK) | Users' representatives | **Planned validation**: form ready, not yet distributed | [survey/survey-form.md](survey/survey-form.md) |
| S5. Interviews with users and 1 expert | Discussions with users' representatives | **3 conducted** (2 users, 1 dietitian) by Kadirbay B.; full records pending | [interview summary](interviews/interview-summary-kadirbay.md), [03](03-recruitment-and-consent.md), [04](04-interview-guide.md), [05](05-results-template.md) |

### 2. Key findings

**S1. The problem is large and local** (details and references in [01-desk-research.md](01-desk-research.md)):

| # | Finding | Source |
|---|---|---|
| D1 | 2.6 billion adults with overweight and 940 million with obesity in 2024; 3.80 billion adults with overweight or obesity forecast for 2050. | 01, refs [1]–[3] |
| D2 | In Kazakhstan about one in five adults has obesity (21.8%, modelled), and about 30% of surveyed adults have overweight. | 01, refs [4], [5] |
| D3 | 19.7% of adults in Kazakhstan do not meet the WHO physical activity recommendation. | 01, ref [6] |
| D4 | In the Astana region, 44% of adults aged 50–74 had obesity and 72% central obesity (2012–2015). | 01, ref [9] |
| D5 | 21% of children aged 6–9 in Kazakhstan have overweight or obesity. | 01, ref [8] |
| D6 | The main open obesity-factor dataset is Latin American and 77% synthetic, so it does not represent users in Kazakhstan. | 01, refs [10], [11] |

**S2. What is known about users of weight-management apps** (numbers as reported in the cited studies; populations are not from Kazakhstan):

| # | Finding | Source (literature review numbering) |
|---|---|---|
| U1 | Engagement with self-monitoring drops sharply: in a real-world nutrition app, food logging fell from 63.2% of days while a sensor was worn to 2.4% after it was removed. | [16] |
| U2 | Engagement is linked to outcome: users who opened more feedback messages lost more weight, yet tailored feedback alone did not improve weight loss over self-monitoring (−2.12% vs −2.39%, P = .68). | [4] |
| U3 | Engagement is rarely defined or measured: among 59 nutrition-app studies, only 31% defined engagement and 29% measured retention. | [5] |
| U4 | Prompts with personalized thresholds increased steps in the hour after a prompt but did not change weekly activity. | [6] |
| U5 | Recommendations from an opaque general-purpose AI chatbot for a simulated person with obesity contained less energy than requested, unbalanced macronutrients and too little calcium. | [11] |
| U6 | Stand-alone digital interventions have small effects that disappear against active controls. | [1] |

**S3. What existing applications do not offer** (gaps G1–G4 in [existing-systems.md](existing-systems.md), Section 5.1):

| # | Gap |
|---|---|
| G1 | None of the five applications explains its recommendations or states guideline constraints. |
| G2 | None gives joint nutrition and activity recommendations or identifies the user's deviating lifestyle factors. |
| G3 | None combines local language, local foods and activity data; Kazakh is available in one application only. |
| G4 | None has been tested against a self-monitoring-only control. |

**S5. Interviews (n = 3).** Main points as stated in the [interview summary](interviews/interview-summary-kadirbay.md): the two users found calorie-only logging tiring without an explanation of why weight changes, and preferred context-aware suggestions to static diet plans; the dietitian stressed that obesity is multi-factorial and that one-size-fits-all advice fails. These points will be coded with the procedure in Section 6.1 when the full records are added.

**S4. Survey: ⏳ not yet collected.** Results will be added here as aggregated counts, with the number of respondents for each finding.

### 3. Verified findings versus assumptions

| Statement | Status | Evidence |
|---|---|---|
| Excess weight is a large and growing problem worldwide and in Kazakhstan. | **Verified** | D1, D2 |
| Insufficient physical activity is common in Kazakhstan. | **Verified** | D3 |
| Obesity, including central obesity, is highly prevalent in the Astana region. | **Partially verified**: older adults, 2012–2015 | D4 |
| Open obesity-factor data can be used as-is for users in Kazakhstan. | **Refuted** | D6 |
| Existing applications do not explain recommendations, do not combine nutrition and activity recommendations, and do not cover the local context. | **Verified** for the five compared applications (official descriptions) | G1–G3 |
| Users of self-monitoring apps disengage over time (A2). | **Partially supported** by literature in non-local populations; reasons and local pattern unverified | U1, U2; S4–S5 pending |
| Users want nutrition and activity advice in one tool (A3). | **Need supported** by literature and gap analysis; **user preference unverified** | G2, U4; S4–S5 pending |
| Users trust explained recommendations more (A4). | **Need supported** (opaque advice can be wrong); **user trust unverified** | G1, U5; S4–S5 pending |
| Existing food databases lack local dishes (A5). | **Partially supported**: one of five applications covers local dishes; hands-on check pending | G3; S4–S5 pending |
| A1, A6–A12: own weight-management attempts, perceived factors, step-target preference, reminders, data sharing, privacy, logging, safety screening | **Unverified assumptions** | To be tested by S4 (survey) and S5 (interviews) |
| E1–E4: safety and scope of guideline-based advice without supervision | **Unverified assumptions**; scope follows the EASO position statement and eligibility rules in the proposal | Expert interview (S5) |

### 4. Findings and requirements

Requirements cite their basis with the source codes defined in [requirements.md](../requirements/requirements.md), Section 2.3: **E** for evidence (D, U, L, G findings), **A** for unverified assumptions.

| Finding | Requirements | Basis status |
|---|---|---|
| D1–D3 | Overall aim; physical activity module FR-10, FR-12, FR-18 | Verified |
| D4 | Waist circumference logging FR-06, FR-09 | Partially verified |
| D5 | Children excluded from scope (proposal, Section 7.2) | Verified |
| D6 | Guideline-based factor scoring FR-13, FR-14 instead of a model trained on open data | Verified |
| U1, U2, U3, U6 | Engagement logging FR-32; self-monitoring control mode FR-31; offline logging NFR-12 | Verified (literature) |
| U4 | Baseline week FR-12; prompts combined with nutrition rules FR-22, FR-25 | Verified (literature) |
| U5, G1 | Explanation for every recommendation FR-23; hard constraints FR-24 | Verified need; user trust is assumption A4 |
| G2 | Factor ranking FR-13, FR-14; joint recommendations FR-15–FR-22 | Verified need; user preference is assumption A3 |
| G3 | Local food database FR-07, FR-17; Kazakh, Russian, English interface FR-39 | Partially verified; A5 pending |
| G4 | Control mode FR-31; randomization FR-30 | Verified |
| A7, A8, A9, A10, A11, A12 | FR-18, FR-25, FR-26, FR-11, NFR-04, FR-09, FR-04 | **Assumption**: requirements stay, marked "A", until S4–S5 |

### 5. Limitations

- The evidence for item 2 is secondary. It shows that the problem exists and that existing tools do not address it, but it does not show what potential users in Astana need or prefer. These user-level statements remain assumptions until S4–S5 are completed.
- Literature on app users comes from other countries and populations (U1–U6).
- Kazakhstan obesity prevalence is a modelled estimate; Astana data refer to older adults in 2012–2015.
- The existing-system comparison relies on official descriptions; the hands-on check is still pending.

### 6. Planned validation

| Step | What | Target | Result goes to |
|---|---|---|---|
| 1 | Distribute the online survey ([survey/survey-form.md](survey/survey-form.md)) through AITU chats and personal contacts | At least 15 eligible responses | [survey/results.md](survey/results.md) (aggregated counts only) |
| 2 | Add full records of the three interviews already held (I1–I3); if needed, 1–2 more user interviews | Before pre-defense 2 | `interviews/` and this report |
| 3 | Update the assumptions register and the source status of requirements | After steps 1–2 | [02-assumptions-register.md](02-assumptions-register.md), requirements |

## 6.3 Theme table (working)

| Theme | Finding IDs | Participants (count) | Related assumption |
|---|---|---|---|
| | | | |

## 6.4 Assumption tally (working)

| Assumption | P1 | P2 | P3 | P4 | P5 | Support | Contradict | Status |
|---|---|---|---|---|---|---|---|---|
| A1 | | | | | | | | |
| A2 | | | | | | | | |
| A3 | | | | | | | | |
| A4 | | | | | | | | |
| A5 | | | | | | | | |
| A6 | | | | | | | | |
| A7 | | | | | | | | |
| A8 | | | | | | | | |
| A9 | | | | | | | | |
| A10 | | | | | | | | |
| A11 | | | | | | | | |
| A12 | | | | | | | | |

Mark each cell with **+**, **−**, **?** or **n/a**.

## 6.5 Requirement traceability (working)

| Requirement (draft) | Based on | Evidence | Status of basis |
|---|---|---|---|
| e.g. FR-xx The food database includes locally consumed dishes. | A5 | P_-F_, X1-F_ | Verified / assumption |
| e.g. FR-xx Every recommendation displays the rule that produced it. | A4; proposal objective O1 | P_-F_ | |

Requirements that come from the literature or from the project aim rather than from users (for example, constraint verification) cite the source instead of interview findings.

## 6.6 Pre-defense slide (draft text)

**Title:** Evidence of relevance

**1. The problem is large and local (verified, S1)**
- World: 2.6 billion adults with overweight, 940 million with obesity (WHO, 2024)
- Kazakhstan: about 1 in 5 adults with obesity (21.8%, NCD-RisC); about 30% with overweight (STEPS 2021–22, n = 6,720)
- 19.7% of adults in Kazakhstan do not meet WHO physical activity recommendations

**2. Users disengage and current tools do not fill the gap (verified, S2–S3)**
- Food logging fell from 63.2% to 2.4% of days once passive support stopped; tailored feedback alone did not beat self-monitoring
- None of 5 compared apps explains its recommendations or combines nutrition and activity recommendations; Kazakh in 1 of 5

**3. Verified vs assumptions**
- Green: problem scale, local prevalence, low activity, gaps G1–G4
- Yellow: A2–A5 (supported by literature or comparison, not yet by local users)
- Grey: A1, A6–A12, E1–E4 (assumptions; requirements based on them are marked "A")

**4. Planned validation**
- Online survey (target ≥ 15 responses) and 3–4 user + 1 expert interviews; results update the register and the requirements
