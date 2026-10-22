# Evidence of Relevance

Pre-defense item 2 · YouTrack task [DOA-4](https://yeralytemir.youtrack.cloud/issue/DOA-4) · Owner: Ibrayev Ansar · Due: 23 October 2026

The committee asks *"what evidence informs the requirements and whether verified findings are distinguished from assumptions"*, and expects 3–5 discussions with user representatives or a substantive agreement with a client. This folder combines two kinds of evidence:

1. **Analysis of available data** (desk research): complete.
2. **Interviews with potential users and one expert**: materials ready, interviews to be conducted.

## Contents

| File | Content | Status |
|---|---|---|
| [01-desk-research.md](01-desk-research.md) | Obesity statistics: world, Kazakhstan, Astana region; open obesity-factor data; what this does and does not verify | Complete |
| [02-assumptions-register.md](02-assumptions-register.md) | User and expert assumptions behind the requirements, decision rule for "verified" | Ready; statuses to update after interviews |
| [03-recruitment-and-consent.md](03-recruitment-and-consent.md) | Selection criteria, screening, recruitment messages, informed consent (EN/RU) | Ready |
| [04-interview-guide.md](04-interview-guide.md) | User guide (Q1–Q20) and expert guide (X1–X8), EN/RU, linked to assumptions | Ready |
| [05-results-template.md](05-results-template.md) | Record template for each interview, data-protection rules | Ready |
| [relevance-summary.md](relevance-summary.md) | Analysis steps, summary report (finding → requirement → status), slide outline | Ready; to be filled after interviews |
| [interviews/](interviews/) | Anonymised records P1–P5, X1 | Empty until interviews take place |

## Plan to complete DOA-4

Status on 22 October 2026: everything that does not depend on interview data is complete, including the draft summary with desk-research findings ([relevance-summary.md](relevance-summary.md)). The interviews remain.

| When | Step | Who |
|---|---|---|
| 22 Oct, today | Ask the supervisor whether anonymised requirements interviews need a formal ethics application (03, Section 3.5). | Ansar |
| 22 Oct, today | Send the recruitment messages (03, Section 3.3) to 6–8 people to get 3–4 interviews, and the expert message to 1–2 specialists. Fill the quota in 6.2, part 2 (P1–P4, X1). | Ansar |
| 22–23 Oct | Conduct the interviews (30–40 min each, online is fine) using 04. Write notes in the template (05) within 24 hours. | Ansar; a team member as note-taker if available |
| 23 Oct | Send the notes for analysis. Then fill in the records in `interviews/`, update the assumptions register, and complete the pending parts of the summary and slide. | Ansar and Claude |
| 23 Oct | Pull request with the results, approval, merge, and close DOA-4. | Ansar |

## Acceptance criteria for DOA-4

- [x] Desk research with verifiable sources (IEEE style).
- [x] Interview materials linked to explicit assumptions.
- [ ] At least 3 interviews conducted, anonymised records in `interviews/`.
- [ ] Assumptions register updated with a status for every assumption.
- [ ] Summary report separating verified findings from assumptions, with impact on requirements.
- [ ] Pull request reviewed by another team member and linked in YouTrack.

## Principles

- No interview results, quotations or numbers are entered until the interviews have taken place.
- All statistics come from the sources listed in [01-desk-research.md](01-desk-research.md).
- No personal data are stored in the repository (see 05, Section 5.1).
