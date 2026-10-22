# 2. Assumptions Register

| | |
|---|---|
| **YouTrack task** | [DOA-4](https://yeralytemir.youtrack.cloud/issue/DOA-4) |
| **Purpose** | List every assumption about users that the requirements depend on, and record how each one was tested |
| **Status** | All user assumptions are **unverified** until the interviews are completed |

The committee evaluates *"what evidence informs the requirements and whether verified findings are distinguished from assumptions"*. This register is the single place where that distinction is made. Each assumption is linked to the interview questions that test it (see [04-interview-guide.md](04-interview-guide.md)) and to the requirement area it affects.

## 2.1 Status definitions

The team agreed the following decision rule before the interviews, so that the status is not chosen after seeing the results.

| Status | Rule (for 4–5 interviews) |
|---|---|
| **Verified** | Supported by at least 3 participants, with concrete examples from their own experience, and contradicted by none; or supported by a cited source (desk research) |
| **Partially supported** | Supported by 2 participants, or supported by most but with important exceptions |
| **Refuted** | Contradicted by at least 3 participants, or by a cited source |
| **Inconclusive** | Mixed or vague answers; not enough evidence either way |
| **Unverified (assumption)** | Not yet tested. Requirements based on it are marked as assumption-based |

Statements of intention ("I would use it") are weaker evidence than descriptions of past behaviour ("I stopped using the app after two weeks because..."). In the analysis, only past behaviour and concrete examples count towards **Verified**.

## 2.2 User assumptions

| ID | Assumption | Tested by | Requirement area affected | Status | Evidence (filled after analysis) |
|---|---|---|---|---|---|
| A1 | Adults with overweight in the target group have already tried to manage their weight, and most have tried at least one app or online programme. | Q4, Q8 | Problem relevance; onboarding | Unverified | |
| A2 | Users stop using weight-management apps within weeks; the main reasons are logging effort, generic advice and loss of motivation. | Q9, Q10 | Engagement features; logging UX | Unverified | |
| A3 | Users want nutrition and physical activity advice in one tool rather than separate apps. | Q11, Q14 | Joint recommendation engine (O1) | Unverified | |
| A4 | Users trust a recommendation more when the app explains why it was given. | Q15 | Explanation of every recommendation | Unverified | |
| A5 | Existing food databases lack locally consumed foods and dishes, which makes logging inaccurate or tedious. | Q10, Q12 | Local food database | Unverified | |
| A6 | Users can name the lifestyle factors they believe affect their weight (eating patterns, activity, sleep, stress, work schedule), and want the app to show which of their factors matter most. | Q5, Q6, Q13 | Factor identification | Unverified | |
| A7 | Users prefer small, gradual activity targets based on their own baseline over fixed targets such as 10,000 steps. | Q7, Q16 | Step-target rules | Unverified | |
| A8 | Push reminders are acceptable if they are few and timed to the user's routine; frequent generic reminders lead to disabling notifications. | Q17 | Prompt scheduling | Unverified | |
| A9 | Most users are willing to share step data from their phone; a smaller share owns and would connect a wearable. | Q12, Q18 | Health Connect / HealthKit integration | Unverified | |
| A10 | Users are concerned about the privacy of weight and health data, and this affects whether they register. | Q19 | Data protection NFRs; consent screens | Unverified | |
| A11 | Users accept weekly weight logging and occasional waist measurement. | Q18 | Anthropometric logging | Unverified | |
| A12 | Users accept a safety screening questionnaire and referral to a doctor when they have a medical condition. | Q20 | Eligibility screening (PAR-Q+) | Unverified | |

## 2.3 Expert assumptions (optional expert interview)

These apply only if one of the interviews is with a dietitian, endocrinologist, general practitioner or certified fitness trainer.

| ID | Assumption | Tested by | Requirement area affected | Status | Evidence |
|---|---|---|---|---|---|
| E1 | For adults with BMI 25.0–34.9 kg/m² and no exclusion conditions, guideline-based energy, macronutrient and step targets can be given without individual clinical supervision. | X3, X4 | Scope; eligibility rules | Unverified | |
| E2 | The planned exclusion criteria (diabetes, cardiovascular disease, pregnancy, weight-loss medication, PAR-Q+ contraindications) are sufficient for safety. | X5 | Eligibility screening | Unverified | |
| E3 | Common local dietary patterns that drive excess weight can be expressed as rules (for example, high-energy traditional dishes, bread, sugary drinks, late dinners). | X2, X6 | Local food rules | Unverified | |
| E4 | Patients most often fail because of adherence, not lack of knowledge. | X1, X7 | Engagement features | Unverified | |

## 2.4 Assumptions that cannot be tested by interviews

| ID | Assumption | How it will be tested | Pre-defense |
|---|---|---|---|
| T1 | The recommender improves engagement and weight-related outcomes compared with self-monitoring alone. | 12-week randomized pilot (O3, O4) | Pre-defense 2 / final |
| T2 | Generated plans satisfy the nutritional and activity constraints. | Verification on 200 synthetic profiles (SQ1) | Pre-defense 2 |
| T3 | Enough eligible participants can be recruited in Astana. | Recruitment for the pilot; interview recruitment gives an early signal | Final |
