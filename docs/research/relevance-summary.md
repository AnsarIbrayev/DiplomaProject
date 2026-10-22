# 6. Relevance Summary: Analysis Procedure and Report

| | |
|---|---|
| **YouTrack task** | [DOA-4](https://yeralytemir.youtrack.cloud/issue/DOA-4) |
| **Status** | Procedure defined; **summary to be filled after the interviews**. No results have been entered yet. |

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

## 6.2 Summary report (structure to fill in)

### 1. Method

Semi-structured interviews (30–40 min) following [04-interview-guide.md](04-interview-guide.md), conducted on [dates] by [interviewer]; [n] in person, [n] online; language: [ ]. Informed consent was obtained from all participants. Combined with desk research ([01-desk-research.md](01-desk-research.md)).

### 2. Participants

| Code | Age band | Sex | BMI band | App experience | Wearable | Mode |
|---|---|---|---|---|---|---|
| P1 | | | | | | |
| P2 | | | | | | |
| P3 | | | | | | |
| P4 | | | | | | |
| X1 | Profession: | Experience: | – | – | – | |

### 3. Key findings

For each theme: one-sentence finding, number of participants (for example, "4 of 4"), the supporting finding IDs, and at most one anonymised quotation (only from participants who allowed quotations).

| # | Theme | Finding | Participants | Finding IDs |
|---|---|---|---|---|
| T1 | | | _ of _ | |

### 4. Verified findings versus assumptions

| Statement | Status | Evidence |
|---|---|---|
| (copy each A- and E-assumption with its final status from the register) | Verified / Partially supported / Refuted / Inconclusive / Unverified | Finding IDs or source |

### 5. Findings and requirements

Every finding is linked to at least one requirement and marked as verified or assumption (acceptance criterion of DOA-4).

| Finding / theme | Requirement(s) | Status | Evidence |
|---|---|---|---|
| T1 ... | FR-__, NFR-__ | Verified / Assumption | Finding IDs or source |

Then list requirements that were added, changed, re-prioritized or removed because of the evidence (see 6.5).

### 6. Limitations

State at least the following, adapted to what actually happened:

- small convenience sample (n = __) recruited through personal and university networks;
- self-reported weight band and behaviour;
- possible interviewer and social-desirability bias;
- statements about future use are weaker than past behaviour;
- the sample may not represent all age groups of the target population.

### 7. Next steps

What remains unverified and how it will be tested (for example, usability testing of the prototype and the 12-week pilot; see register Section 2.4).

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

## 6.6 Pre-defense slide outline

**Title:** Evidence of relevance

1. **Problem scale (verified, desk research):** global and Kazakhstan figures from [01-desk-research.md](01-desk-research.md), with sources.
2. **Interviews:** n, who, when, method (one line).
3. **Top 3–4 findings** with participant counts.
4. **Verified vs assumptions:** a compact, colour-coded version of the table in Section 6.2, part 4.
5. **Impact on requirements:** 2–3 examples of requirements that changed.
