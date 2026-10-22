# 6. Relevance Summary: Analysis Procedure and Report

| | |
|---|---|
| **YouTrack task** | [DOA-4](https://yeralytemir.youtrack.cloud/issue/DOA-4) |
| **Status** | Draft: desk-research findings complete; interview findings pending. No interview results have been entered. |

## 6.1 Analysis procedure

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

## 6.2 Summary report (draft)

> **Draft status, 22 October 2026.** Parts based on desk research are complete. Parts marked **⏳ Pending interviews** are filled in only after the interviews have taken place. Until then every user assumption keeps the status *Unverified*.

### 1. Method

**Desk research (complete).** Published statistics and open data were reviewed on 22 October 2026: WHO, NCD-RisC and GBD 2021 for global data; the national WHO STEPS survey 2021–2022 (n = 6,720), WHO COSI 2020 and NCD-RisC estimates for Kazakhstan; a cohort study for the Astana region; and the UCI obesity-factor dataset. Full results and references are in [01-desk-research.md](01-desk-research.md).

**Interviews (⏳ pending).** Semi-structured interviews (30–40 min) following [04-interview-guide.md](04-interview-guide.md), conducted on [dates] by [interviewer]; [n] in person, [n] online; language: [ ]. Informed consent obtained from all participants.

### 2. Participants (⏳ pending)

Planned profiles (recruitment quota from [03-recruitment-and-consent.md](03-recruitment-and-consent.md), Section 3.1) and actual participants:

| Code | Planned profile | Age band | Sex | BMI band | App experience | Wearable | Mode |
|---|---|---|---|---|---|---|---|
| P1 | Student, 18–24, trying to lose weight | | | | | | |
| P2 | Working adult, 25–44, has used a calorie or fitness app | | | | | | |
| P3 | Adult 35–60, has never used a weight app | | | | | | |
| P4 | Any profile not yet covered (other sex than most of P1–P3) | | | | | | |
| X1 | Dietitian, doctor or certified fitness trainer | Profession: | Experience: | – | – | – | |

### 3. Key findings

**From desk research (verified by sources):**

| # | Finding | Evidence |
|---|---|---|
| D1 | Overweight and obesity affect close to half of the world's adults (2.6 billion with overweight, 940 million with obesity in 2024), and the number is forecast to keep rising to 3.80 billion adults with overweight or obesity by 2050. | [01, refs 1–3] |
| D2 | In Kazakhstan about one in five adults is estimated to live with obesity (21.8%), and about 30% of surveyed adults have overweight. | [01, refs 4–5] |
| D3 | One in five adults in Kazakhstan (19.7%) does not meet the WHO physical activity recommendation. | [01, ref 6] |
| D4 | In the Astana region, 44% of adults aged 50–74 had obesity and 72% had central obesity (2012–2015 data). | [01, ref 9] |
| D5 | Excess weight starts early: 21% of children aged 6–9 in Kazakhstan have overweight or obesity. | [01, ref 8] |
| D6 | The main open obesity-factor dataset is from Latin America and 77% synthetic, so it does not represent users in Kazakhstan. | [01, refs 10–11] |

**From interviews (⏳ pending):** one row per theme, with the participant count (for example, "3 of 4"), the finding IDs, and at most one anonymised quotation.

| # | Theme | Finding | Participants | Finding IDs |
|---|---|---|---|---|
| T1 | | | _ of _ | |

### 4. Verified findings versus assumptions

| Statement | Status | Evidence |
|---|---|---|
| Excess weight is a large and growing global problem. | **Verified** | D1 |
| Obesity and overweight are common among adults in Kazakhstan. | **Verified** | D2 |
| Insufficient physical activity is common in Kazakhstan. | **Verified** | D3 |
| Obesity, including central obesity, is highly prevalent in the Astana region. | **Partially verified**: older adults, 2012–2015 | D4 |
| Open obesity-factor data can be used as-is for users in Kazakhstan. | **Refuted** | D6 |
| A1–A12: user needs and behaviour (app use and abandonment, joint nutrition and activity advice, explanations, local foods, factors, targets, reminders, data sharing, privacy, logging, safety screening) | **Unverified**, ⏳ pending interviews | [02-assumptions-register.md](02-assumptions-register.md) |
| E1–E4: safety and scope of guideline-based advice without supervision | **Unverified**, ⏳ pending expert interview | [02-assumptions-register.md](02-assumptions-register.md) |

### 5. Findings and requirements

Requirement IDs (FR-xx, NFR-xx) are assigned in the requirements specification (pre-defense item 6). Until then, findings are linked to the requirement areas of the project scope (`docs/proposal/proposal.md`, Section 7.1).

| Finding | Requirement area | Status | Evidence |
|---|---|---|---|
| D1, D2 | Overall aim: a weight-management tool for adults with overweight or class I obesity is relevant in Kazakhstan. | Verified | Sources |
| D3 | Physical activity module: step targets raised gradually from the user's own baseline, not only nutrition tracking. | Verified (need); the form of the targets is assumption A7 | Source; A7 pending |
| D4 | Anthropometric logging includes waist circumference, not only weight and BMI. | Partially verified | Source (older adults) |
| D5 | Children and adolescents stay out of scope: the system's guideline-based rules are for adults only. | Verified (scope decision) | Source; proposal Section 7.2 |
| D6 | Factor identification is validated on locally collected data (pilot), not only on open datasets; the food database includes locally consumed foods. | Verified (need for local data); local foods also tested by A5 | Source; A5 pending |
| T1 … | ⏳ pending interviews | | |

Then list requirements that were added, changed, re-prioritized or removed because of interview evidence (see 6.5).

### 6. Limitations

**Desk research:**

- Kazakhstan obesity prevalence is a modelled estimate (NCD-RisC); the national STEPS articles report overweight and other indicators but not one overall obesity figure in their abstracts.
- The three STEPS articles use the same survey sample and are not independent confirmations.
- No recent estimate for working-age adults in Astana was found; the Astana data refer to adults aged 50–74 in 2012–2015.

**Interviews (⏳ adapt after the interviews):**

- small convenience sample (n = __) recruited through personal and university networks;
- self-reported weight band and behaviour;
- possible interviewer and social-desirability bias;
- statements about future use are weaker than past behaviour;
- the sample may not represent all age groups of the target population.

### 7. Next steps

1. Conduct at least 3 interviews (target: P1–P4 and X1) and fill in the records in `interviews/`.
2. Update the assumptions register and Sections 2–6 of this summary.
3. Use the verified findings when writing the requirements specification (pre-defense item 6), and label requirements based on unverified assumptions.
4. Assumptions that interviews cannot test (T1–T3 in the register) are tested by prototype usability testing and the 12-week pilot.

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

**1. The problem is large and local (desk research, verified)**
- World: 2.6 billion adults with overweight, 940 million with obesity (WHO, 2024)
- Kazakhstan: about 1 in 5 adults with obesity (21.8%, NCD-RisC); about 30% with overweight (STEPS 2021–22, n = 6,720)
- 19.7% of adults in Kazakhstan do not meet WHO physical activity recommendations
- Open obesity-factor data are not local (Latin America, 77% synthetic), so local evidence is needed

**2. What users told us (⏳ pending interviews)**
- n = __ interviews (__ users, __ expert), [dates], semi-structured, 30–40 min
- Top 3 findings with counts (for example, "3 of 4 stopped using a calorie app within a month because ...")

**3. Verified vs assumptions**
- Green: problem scale, local prevalence, low activity (sources)
- Yellow or red: user assumptions A1–A12 with their status after the interviews

**4. Impact on requirements**
- 2–3 requirements that the evidence confirmed or changed (from Section 6.2, part 5)
